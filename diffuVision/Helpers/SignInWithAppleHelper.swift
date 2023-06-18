//
//  SignInWithAppleHelper.swift
//  diffuVision
//
//  Created by İhsan Akbay on 17.06.2023.
//

import AuthenticationServices
import CryptoKit
import SwiftUI

struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable {
	let type: ASAuthorizationAppleIDButton.ButtonType
	let style: ASAuthorizationAppleIDButton.Style

	func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
		ASAuthorizationAppleIDButton(authorizationButtonType: type, authorizationButtonStyle: style)
	}

	func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}

@MainActor
final class SignInWithAppleHelper: NSObject {
	private var currentNonce: String?
	private var completionHandler: ((Result<SignInWithAppleResult, Swift.Error>) -> Void)? = nil

	func startSignInWithAppleFlow() async throws -> SignInWithAppleResult {
		try await withCheckedThrowingContinuation { continuation in
			self.startSignInWithAppleFlow { result in
				switch result {
				case .success(let signInWithAppleResult):
					continuation.resume(returning: signInWithAppleResult)
					return
				case .failure(let error):
					continuation.resume(throwing: error)
					return
				}
			}
		}
	}

	func startSignInWithAppleFlow(completion: @escaping (Result<SignInWithAppleResult, Swift.Error>) -> Void) {
		guard let topVC = Utilities.shared.topViewController() else {
			completion(.failure(NetworkRequestError.serverError))
			return
		}

		let nonce = randomNonceString()
		currentNonce = nonce
		completionHandler = completion

		let appleIDProvider = ASAuthorizationAppleIDProvider()
		let request = appleIDProvider.createRequest()
		request.requestedScopes = [.fullName, .email]
		request.nonce = sha256(nonce)

		let authorizationController = ASAuthorizationController(authorizationRequests: [request])
		authorizationController.delegate = self
		authorizationController.presentationContextProvider = topVC
		authorizationController.performRequests()
	}

	private func sha256(_ input: String) -> String {
		let inputData = Data(input.utf8)
		let hashedData = SHA256.hash(data: inputData)
		let hashString = hashedData.compactMap {
			String(format: "%02x", $0)
		}.joined()

		return hashString
	}

	private func randomNonceString(length: Int = 32) -> String {
		precondition(length > 0)
		var randomBytes = [UInt8](repeating: 0, count: length)
		let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
		if errorCode != errSecSuccess {
			fatalError(
				"Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
			)
		}

		let charset: [Character] =
			Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

		let nonce = randomBytes.map { byte in
			// Pick a random character from the set, wrapping around if needed.
			charset[Int(byte) % charset.count]
		}

		return String(nonce)
	}
}

extension SignInWithAppleHelper: ASAuthorizationControllerDelegate {
	func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
		guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
		      let nonce = currentNonce,
		      let appleIDToken = appleIDCredential.identityToken,
		      let idTokenString = String(data: appleIDToken, encoding: .utf8)
		else {
			completionHandler?(.failure(NetworkRequestError.serverError))
			return
		}

		let firstName = appleIDCredential.fullName?.givenName ?? ""
		let middleName = appleIDCredential.fullName?.middleName ?? ""
		let familyName = appleIDCredential.fullName?.familyName ?? ""
		let fullName = [firstName, middleName, familyName].filter { !$0.isEmpty }
		let name = fullName.joined(separator: " ")
		let email = appleIDCredential.email ?? ""

		let credentials = SignInWithAppleResult(token: idTokenString, nonce: nonce, name: name, email: email)
		completionHandler?(.success(credentials))
	}

	func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
		// Handle error.
		print("Sign in with Apple errored: \(error)")
		completionHandler?(.failure(NetworkRequestError.customError(error.localizedDescription)))
	}
}

extension UIViewController: ASAuthorizationControllerPresentationContextProviding {
	public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return view.window!
	}
}

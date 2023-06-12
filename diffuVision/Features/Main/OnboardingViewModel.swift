//
//  OnboardingViewModel.swift
//  diffuVision
//
//  Created by İhsan Akbay on 12.06.2023.
//

import AuthenticationServices
import SwiftUI

final class OnboardingViewModel: ObservableObject {
	@AppStorage(AppStorageKeys.isOnboarding.rawValue) var isOnboarding: Bool?

	@Published var errorMessage: Swift.Error?

	func configure(_ request: ASAuthorizationAppleIDRequest) {
		request.requestedScopes = [.email, .fullName]
	}

	func handleSignInWithApple(_ authResult: Result<ASAuthorization, Error>) {
		switch authResult {
		case .success(let auth):
			print(auth)
			switch auth.credential {
			case let appleIdCredentials as ASAuthorizationAppleIDCredential:
				if let appleUser = AppleUser(credentials: appleIdCredentials),
				   let appleUserData = try? JSONEncoder().encode(appleUser)
				{
					UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userId)
					print("saved apple user", appleUser)
				}

			default:
				print(auth.credential)
			}
		case .failure(let error):
			print(error)
			self.errorMessage = error
		}
	}
}

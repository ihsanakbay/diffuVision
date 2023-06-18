//
//  OnboardingViewModel.swift
//  diffuVision
//
//  Created by İhsan Akbay on 12.06.2023.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

@MainActor
final class OnboardingViewModel: ObservableObject {
	@Published var errorMessage: Swift.Error?
	@AppStorage(StorageKeys.isAuthenticated.rawValue) var isAuthenticated: Bool?

	func signInWithApple() async throws {
		do {
			let helper = SignInWithAppleHelper()
			let tokens = try await helper.startSignInWithAppleFlow()
			let authDataResult = try await AuthenticationManager.shared.signInWithApple(credentials: tokens)
			let user = DBUser(auth: authDataResult)
			try await UserManager.shared.createNewUser(user: user)
			isAuthenticated = true
		} catch {
			errorMessage = NetworkRequestError.customError(error.localizedDescription)
			isAuthenticated = false
		}
	}
}

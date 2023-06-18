//
//  SettingsViewModel.swift
//  diffuVision
//
//  Created by İhsan Akbay on 18.06.2023.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
	@Published var errorMessage: Swift.Error?
	@AppStorage(StorageKeys.isAuthenticated.rawValue) var isAuthenticated: Bool?

	func logout() {
		do {
			try AuthenticationManager.shared.signOut()
			isAuthenticated = false
		} catch {
			errorMessage = NetworkRequestError.customError(error.localizedDescription)
		}
	}

	func deleteAccount() async {
		do {
			try await AuthenticationManager.shared.delete()
			isAuthenticated = false
		} catch {
			errorMessage = NetworkRequestError.customError(error.localizedDescription)
		}
	}

	func getUserEmail() -> String {
		if let user = try? AuthenticationManager.shared.getAuthenticatedUser() {
			return user.email ?? "N/A"
		}
		return "N/A"
	}
}

//
//  diffuVisionApp.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

@main
struct diffuVisionApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@StateObject var store: Store = .init()
	@AppStorage(StorageKeys.isAuthenticated.rawValue) var isAuthenticated: Bool = false
	@AppStorage(StorageKeys.appStartCount.rawValue) var appStartCount = 0

	private func checkUserState() {
		if let authUser = try? AuthenticationManager.shared.getAuthenticatedUser(),
		   !authUser.uid.isEmpty
		{
			isAuthenticated = true
			countIncrement()
			return
		}
		isAuthenticated = false
	}

	var body: some Scene {
		WindowGroup {
			Group {
				if self.isAuthenticated {
					MainTabView()
						.preferredColorScheme(.dark)
						.environmentObject(self.store)
				} else {
					OnboardingView()
						.preferredColorScheme(.dark)
						.environmentObject(self.store)
				}
			}
			.onAppear {
				self.checkUserState()
			}
		}
	}

	private func countIncrement() {
		var count = appStartCount
		count += 1
		appStartCount = count
	}
}

var ENV: ApiKeyable {
	return ConfigEnv()
}

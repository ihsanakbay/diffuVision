//
//  diffuVisionApp.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

@main
struct diffuVisionApp: App {
	@AppStorage(AppStorageKeys.isOnboarding.rawValue) var isOnboarding: Bool = true

	var body: some Scene {
		WindowGroup {
			if isOnboarding {
				OnboardingView()
					.preferredColorScheme(.dark)
			}
			else {
				MainTabView()
					.preferredColorScheme(.dark)
			}
		}
	}
}

var ENV: ApiKeyable {
	return ConfigEnv()
}

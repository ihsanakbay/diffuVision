//
//  diffuVisionApp.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import RiveRuntime
import SwiftUI

@main
struct diffuVisionApp: App {
	var body: some Scene {
		WindowGroup {
			MainTabView()
		}
	}
}

var ENV: ApiKeyable {
	return ConfigEnv()
}

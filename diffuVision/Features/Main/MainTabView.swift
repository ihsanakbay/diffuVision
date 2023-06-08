//
//  MainTabView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import RiveRuntime
import SwiftUI

enum TabItems {
	case image
	case settings
}

struct MainTabView: View {
	@State private var selectedTab: TabItems = .image
	private var background = RiveViewModel(fileName: "BackgroundAnimation")

	var body: some View {
		TabView(selection: $selectedTab) {
			// MARK: - Homepage

			NavigationView {
				HomePageView()
					.navigationTitle(LocalizationKeys.Keys.appTitle.rawValue.localizedString())
					.navigationBarTitleDisplayMode(.inline)
//					.background(Gradient(colors: [.]))
			}
			.tag(TabItems.image)
			.tabItem {
				Icons.TabView.imageTab.image
			}

			// MARK: - Settings

			NavigationView {
				SettingsPageView()
					.navigationTitle(LocalizationKeys.Keys.tabSettings.rawValue.localizedString())
					.navigationBarTitleDisplayMode(.inline)
					.background(Color.clear)
			}
			.tag(TabItems.settings)
			.tabItem {
				Icons.TabView.settingsTab.image
			}
		}
		.tint(.iconColor)
		
	}
}

struct MainTabView_Previews: PreviewProvider {
	static var previews: some View {
		MainTabView()
	}
}

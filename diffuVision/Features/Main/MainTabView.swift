//
//  MainTabView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

enum TabItems {
	case image
	case settings
}

struct MainTabView: View {
	@State private var selectedTab: TabItems = .image

	init() {
		UITabBar.appearance().unselectedItemTintColor = UIColor(asset: Colors.iconColor)
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			// MARK: - Homepage

			NavigationView {
				HomePageView()
					.navigationTitle(LocalizationStrings.appTitle)
					.navigationBarTitleDisplayMode(.inline)
					.background(Colors.backgroundColor.swiftUIColor)
			}
			.tag(TabItems.image)
			.tabItem {
				Icons.TabView.imageTab.image
			}

			// MARK: - Settings

			NavigationView {
				SettingsPageView()
					.navigationTitle(LocalizationStrings.tabSettings)
					.navigationBarTitleDisplayMode(.inline)
					.background(Colors.backgroundColor.swiftUIColor)
			}
			.tag(TabItems.settings)
			.tabItem {
				Icons.TabView.settingsTab.image
			}
		}
		.tint(Colors.buttonColor.swiftUIColor)
	}
}

struct MainTabView_Previews: PreviewProvider {
	static var previews: some View {
		MainTabView()
	}
}

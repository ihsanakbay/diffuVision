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

	var body: some View {
		TabView(selection: $selectedTab) {
			// MARK: - Homepage

			NavigationView {
				ZStack {
					BackgroundView()
					HomePageView()
						.navigationTitle(LocalizationStrings.appTitle)
						.navigationBarTitleDisplayMode(.inline)
				}
			}
			.tag(TabItems.image)
			.tabItem {
				Icons.TabView.imageTab.image
			}

			// MARK: - Settings

			NavigationView {
				ZStack {
					BackgroundView()
					SettingsPageView()
						.navigationTitle(LocalizationStrings.tabSettings)
						.navigationBarTitleDisplayMode(.automatic)
				}
			}
			.tag(TabItems.settings)
			.tabItem {
				Icons.TabView.settingsTab.image
			}
		}
		.tint(Colors.buttonAndIconColor.swiftUIColor)
	}
}

struct MainTabView_Previews: PreviewProvider {
	static var previews: some View {
		MainTabView()
			.environmentObject(Store())
	}
}

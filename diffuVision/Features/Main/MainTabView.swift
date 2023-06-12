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
		UITabBar.appearance().unselectedItemTintColor = UIColor(asset: Colors.buttonAndIconColor)
	}

	var body: some View {
		TabView(selection: $selectedTab) {
			// MARK: - Homepage

			NavigationView {
				ZStack {
					BackgroundView()
					HomePageView()
						.navigationTitle(LocalizationStrings.appTitle)
						.navigationBarTitleDisplayMode(.inline)
						.toolbar {
							ToolbarItem(placement: .navigationBarTrailing) {
								HStack {
									Image(systemName: Icons.TabView.imageTab.rawValue)
									Text("1000")
										.bold()
								}
								.padding(.horizontal, 8)
								.foregroundColor(Colors.textColor.swiftUIColor)
								.background(Colors.buttonAndIconColor2.swiftUIColor)
								.cornerRadius(10)
							}
						}
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
						.navigationBarTitleDisplayMode(.inline)
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
	}
}

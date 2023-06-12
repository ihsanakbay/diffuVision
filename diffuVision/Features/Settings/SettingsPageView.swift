//
//  SettingsPageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct SettingsPageView: View {
	@State private var isPrivacyPolicyShow: Bool = false

	var body: some View {
		List {
			Section {
				Button {} label: {
					HStack {
						Image(systemName: Icons.Button.feedback.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.feedback)
					}
				}
				.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)

				Button {
					isPrivacyPolicyShow.toggle()
				} label: {
					HStack {
						Image(systemName: Icons.Button.policy.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.policy)
					}
				}
				.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
			}

			Section {
				Button {} label: {
					HStack {
						Image(systemName: Icons.Button.premium.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.premium)
					}
				}
				.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
			}
		}
		.listStyle(.insetGrouped)
		.scrollContentBackground(.hidden)
		.tint(Colors.textColor.swiftUIColor)
		.sheet(isPresented: $isPrivacyPolicyShow) {
			NavigationView {
				WebView(url: URL(string: Constants.privacyPolicyLink)!)
					.ignoresSafeArea()
					.navigationBarTitleDisplayMode(.inline)
					.toolbar {
						ToolbarItem(placement: .navigationBarTrailing) {
							Button {
								isPrivacyPolicyShow.toggle()
							} label: {
								Text(LocalizationStrings.doneButton)
							}
						}
					}
			}
		}
	}
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView()
	}
}

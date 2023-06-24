//
//  SettingsPageView+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 24.06.2023.
//

import SwiftUI

extension SettingsPageView {
	struct PrivacyPolicySheetView: View {
		@Binding var showPrivacyPolicy: Bool

		var body: some View {
			NavigationView {
				WebView(url: URL(string: Constants.privacyPolicyLink)!)
					.ignoresSafeArea()
					.navigationBarTitleDisplayMode(.inline)
					.toolbar {
						ToolbarItem(placement: .navigationBarTrailing) {
							Button {
								showPrivacyPolicy.toggle()
							} label: {
								Text(LocalizationStrings.doneButton)
							}
						}
					}
			}
		}
	}

	struct SubscriptionSheetView: View {
		@Binding var showSubscriptionSheet: Bool

		var body: some View {
			NavigationView {
				SubscriptionListView()
					.navigationBarTitleDisplayMode(.inline)
					.navigationTitle(LocalizationStrings.subscriptions)
					.toolbar {
						ToolbarItem(placement: .navigationBarTrailing) {
							Button {
								showSubscriptionSheet.toggle()
							} label: {
								Text(LocalizationStrings.doneButton)
							}
						}
					}
			}
			.presentationDetents([.medium, .large])
		}
	}

	func premiumSection() -> some View {
		Section {
			Button {
				showSubscriptionSheet.toggle()
			} label: {
				HStack {
					Image(systemName: Icons.Button.premium.rawValue)
						.tint(Colors.buttonAndIconColor.swiftUIColor)
					Text(LocalizationStrings.premium)
				}
			}
		}
		.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
	}

	func userSection() -> some View {
		Section(LocalizationStrings.user) {
			HStack {
				Image(systemName: Icons.General.user.rawValue)
					.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
				Text(viewModel.getUserEmail())
			}
		}
		.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
	}

	func appActionSection() -> some View {
		Section {
			Button {
				DispatchQueue.main.async {
					requestReview()
				}

			} label: {
				HStack {
					Image(systemName: Icons.Button.feedback.rawValue)
						.tint(Colors.buttonAndIconColor.swiftUIColor)
					Text(LocalizationStrings.feedback)
				}
			}

			Button {
				showPrivacyPolicy.toggle()
			} label: {
				HStack {
					Image(systemName: Icons.Button.policy.rawValue)
						.tint(Colors.buttonAndIconColor.swiftUIColor)
					Text(LocalizationStrings.policy)
				}
			}
		}
		.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
	}

	func authSection() -> some View {
		Section {
			Button {
				showLogoutAlert.toggle()
			} label: {
				HStack {
					Image(systemName: Icons.General.logout.rawValue)
						.tint(Colors.buttonAndIconColor.swiftUIColor)
					Text(LocalizationStrings.logout)
						.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
				}
			}

//				Button {
//					self.showDeleteAccountAlert.toggle()
//				} label: {
//					HStack {
//						Image(systemName: Icons.General.delete.rawValue)
//							.tint(Colors.buttonAndIconColor.swiftUIColor)
//						Text(LocalizationStrings.deleteAccount)
//							.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
//					}
//				}
		}
		.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
	}
}

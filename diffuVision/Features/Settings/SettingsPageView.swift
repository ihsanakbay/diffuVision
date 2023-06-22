//
//  SettingsPageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct SettingsPageView: View {
	@StateObject private var vm = SettingsViewModel()
	@State private var isPrivacyPolicyShow: Bool = false
	@State private var showDeleteAccountAlert: Bool = false
	@State private var showSubscriptionSheet: Bool = false

	var body: some View {
		List {
			Section(LocalizationStrings.user) {
				HStack {
					Image(systemName: Icons.General.user.rawValue)
						.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
					Text(vm.getUserEmail())
				}
			}
			.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)

			Section {
				Button {} label: {
					HStack {
						Image(systemName: Icons.Button.feedback.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.feedback)
					}
				}

				Button {
					isPrivacyPolicyShow.toggle()
				} label: {
					HStack {
						Image(systemName: Icons.Button.policy.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.policy)
					}
				}
			}
			.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)

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

			Section {
				Button {
					vm.logout()
				} label: {
					HStack {
						Image(systemName: Icons.General.logout.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.logout)
							.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
					}
				}

				Button {
					self.showDeleteAccountAlert.toggle()
				} label: {
					HStack {
						Image(systemName: Icons.General.delete.rawValue)
							.tint(Colors.buttonAndIconColor.swiftUIColor)
						Text(LocalizationStrings.deleteAccount)
							.foregroundColor(Colors.buttonAndIconColor.swiftUIColor)
					}
				}
			}
			.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
		}
		.errorAlert(error: $vm.errorMessage)
		.confirmationDialog("", isPresented: $showDeleteAccountAlert, actions: {
			Button(LocalizationStrings.yes, role: .destructive) {
				Task {
					await vm.deleteAccount()
				}
			}
			Button(LocalizationStrings.cancel, role: .cancel) {
				showDeleteAccountAlert.toggle()
			}
		}, message: {
			Text(LocalizationStrings.deleteAccountConfirmationMessage)
		})
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

		.fullScreenCover(isPresented: $showSubscriptionSheet) {
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
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView()
	}
}

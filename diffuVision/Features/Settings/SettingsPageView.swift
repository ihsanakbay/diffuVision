//
//  SettingsPageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct SettingsPageView: View {
	@Environment(\.requestReview) var requestReview
	@StateObject var viewModel = SettingsViewModel()
	@State var showPrivacyPolicy: Bool = false
	@State var showLogoutAlert: Bool = false
	@State var showDeleteAccountAlert: Bool = false
	@State var showSubscriptionSheet: Bool = false
	@State var isSubscribed: Bool = false

	var body: some View {
		List {
			userSection()

			appActionSection()

			premiumSection()

			authSection()
		}
		.errorAlert(error: $viewModel.errorMessage)
		.confirmationDialog("", isPresented: $showLogoutAlert, actions: {
			Button(LocalizationStrings.yes, role: .destructive) {
				Task {
					viewModel.logout()
				}
			}
			Button(LocalizationStrings.cancel, role: .cancel) {
				showLogoutAlert.toggle()
			}
		}, message: {
			Text(LocalizationStrings.logoutConfirmationMessage)
		})
		.confirmationDialog("", isPresented: $showDeleteAccountAlert, actions: {
			Button(LocalizationStrings.yes, role: .destructive) {
				Task {
					await viewModel.deleteAccount()
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
		.sheet(isPresented: $showPrivacyPolicy) {
			PrivacyPolicySheetView(showPrivacyPolicy: $showPrivacyPolicy)
		}
		.fullScreenCover(isPresented: $showSubscriptionSheet) {
			SubscriptionSheetView(showSubscriptionSheet: $showSubscriptionSheet, isSubscribed: $isSubscribed)
		}
	}
}

struct SettingsPageView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsPageView()
	}
}

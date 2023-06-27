//
//  SubscriptionCellView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 21.06.2023.
//

import StoreKit
import SwiftUI

struct SubscriptionCellView: View {
	@EnvironmentObject var store: Store
	@State var errorMessage: Swift.Error?
	@Binding var isPurchased: Bool

	let product: Product
	let purchasingEnabled: Bool

	var body: some View {
		HStack {
			if purchasingEnabled {
				productDetail
				Spacer()
				buyButton
					.buttonStyle(BuyButtonStyle(isPurchased: isPurchased))
					.disabled(isPurchased)
			} else {
				productDetail
			}
		}
		.errorAlert(error: $errorMessage)
	}

	@ViewBuilder
	var productDetail: some View {
		if product.type == .autoRenewable {
			VStack(alignment: .leading) {
				Text(product.displayName)
					.bold()
//				Text(product.description)
			}
		} else {
			Text(product.description)
				.frame(alignment: .leading)
		}
	}

	func subscribeButton(_ subscription: Product.SubscriptionInfo) -> some View {
		let unit: String
		let plural = subscription.subscriptionPeriod.value > 1
		switch subscription.subscriptionPeriod.unit {
		case .day:
			unit = plural ? "\(subscription.subscriptionPeriod.value) days" : "day"
		case .week:
			unit = plural ? "\(subscription.subscriptionPeriod.value) weeks" : "week"
		case .month:
			unit = plural ? "\(subscription.subscriptionPeriod.value) months" : "month"
		case .year:
			unit = plural ? "\(subscription.subscriptionPeriod.value) years" : "year"
		@unknown default:
			unit = "period"
		}

		return VStack {
			Text(product.displayPrice)
				.foregroundColor(.white)
				.bold()
				.padding(EdgeInsets(top: -4.0, leading: 0.0, bottom: -8.0, trailing: 0.0))
			Divider()
				.background(Color.white)
			Text(unit)
				.foregroundColor(.white)
				.font(.system(size: 12))
				.padding(EdgeInsets(top: -8.0, leading: 0.0, bottom: -4.0, trailing: 0.0))
		}
	}

	var buyButton: some View {
		Button(action: {
			Task {
				await buy()
			}
		}) {
			if isPurchased {
				Text(Image(systemName: "checkmark"))
					.bold()
					.foregroundColor(.white)
			} else {
				if let subscription = product.subscription {
					subscribeButton(subscription)
				} else {
					Text(product.displayPrice)
						.foregroundColor(.white)
						.bold()
				}
			}
		}
		.onAppear {
			Task {
				isPurchased = (try? await store.isPurchased(product)) ?? false
			}
		}
	}

	func buy() async {
		do {
			if try await store.purchase(product) != nil {
				withAnimation {
					isPurchased = true
					Task {
						await updatePremium(isPremium: isPurchased)
					}
				}
			}
		} catch StoreError.failedVerification {
			errorMessage = NetworkRequestError.customError("Your purchase could not be verified by the App Store.")
		} catch {
			print("Failed purchase for \(product.id): \(error)")
		}
	}

	private func updatePremium(isPremium: Bool) async {
		if let user = try? AuthenticationManager.shared.getAuthenticatedUser() {
			do {
				try await UserManager.shared.updateUserPremiumStatus(userId: user.uid, isPremium: isPremium)
			} catch {
				errorMessage = NetworkRequestError.serverError
			}
		}
	}
}

//
//  SubscriptionView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 19.06.2023.
//

import StoreKit
import SwiftUI

struct SubscriptionView: View {
	@EnvironmentObject var store: Store
	@State var currentSubscription: Product?
	@State var status: Product.SubscriptionInfo.Status?

	@State var isSubscribed: Bool = false
	@State var errorMessage: Swift.Error?

	var availableSubscriptions: [Product] {
		store.subscriptions.filter { $0.id != currentSubscription?.id }
	}

	var body: some View {
		Group {
			if let currentSubscription = currentSubscription {
				Section(LocalizationStrings.mySubscription) {
					SubscriptionCellView(product: currentSubscription, purchasingEnabled: false)
					if let status = status {
						SubscriptionStatusView(product: currentSubscription, status: status)
					}
				}
				.listStyle(GroupedListStyle())
			}

			Section(LocalizationStrings.subscriptions) {
				ForEach(availableSubscriptions) { product in
					SubscriptionCellView(product: product)
				}
			}
			.listStyle(GroupedListStyle())
		}
		.errorAlert(error: $errorMessage)
		.onAppear {
			Task {
				// When this view appears, get the latest subscription status.
				await updateSubscriptionStatus()
			}
		}
		.onChange(of: store.purchasedSubscriptions) { _ in
			Task {
				// When `purchasedSubscriptions` changes, get the latest subscription status.
				await updateSubscriptionStatus()
			}
		}
	}
}

extension SubscriptionView {
	private func subscribe(product: Product) async {
		do {
			if try await store.purchase(product) != nil {
				isSubscribed = true
			}
		} catch {
			errorMessage = error
		}
	}

	private func restore() async {
		try? await AppStore.sync()
	}

	

	@MainActor
	func updateSubscriptionStatus() async {
		do {
			// This app has only one subscription group, so products in the subscriptions
			// array all belong to the same group. The statuses that
			// `product.subscription.status` returns apply to the entire subscription group.
			guard let product = store.subscriptions.first,
			      let statuses = try await product.subscription?.status
			else {
				return
			}

			var highestStatus: Product.SubscriptionInfo.Status?
			var highestProduct: Product?

			// Iterate through `statuses` for this subscription group and find
			// the `Status` with the highest level of service that isn't
			// in an expired or revoked state. For example, a customer may be subscribed to the
			// same product with different levels of service through Family Sharing.
			for status in statuses {
				switch status.state {
				case .expired, .revoked:
					continue
				default:
					let renewalInfo = try store.checkVerified(status.renewalInfo)

					// Find the first subscription product that matches the subscription status renewal info by comparing the product IDs.
					guard let newSubscription = store.subscriptions.first(where: { $0.id == renewalInfo.currentProductID }) else {
						continue
					}

					guard let currentProduct = highestProduct else {
						highestStatus = status
						highestProduct = newSubscription
						continue
					}

					let highestTier = store.tier(for: currentProduct.id)
					let newTier = store.tier(for: renewalInfo.currentProductID)

					if newTier > highestTier {
						highestStatus = status
						highestProduct = newSubscription
					}
				}
			}

			status = highestStatus
			currentSubscription = highestProduct
		} catch {
			print("Could not update subscription status \(error)")
		}
	}
}

struct SubscriptionView_Previews: PreviewProvider {
	static var previews: some View {
		SubscriptionView()
			.environmentObject(Store())
	}
}

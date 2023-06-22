//
//  SubscriptionListView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 21.06.2023.
//

import StoreKit
import SwiftUI

struct SubscriptionListView: View {
	@EnvironmentObject var store: Store

	var body: some View {
		List {
			SubscriptionView()
				.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)

			Button(LocalizationStrings.restore, action: {
				Task {
					try? await AppStore.sync()
				}
			})
			.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)

			Section {
				Text(LocalizationStrings.subscriptionToC)
					.font(.caption2)
					.multilineTextAlignment(.center)
					.foregroundColor(Colors.textColor.swiftUIColor.opacity(0.5))
					.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
			}
		}
		.background(Colors.backgroundColor.swiftUIColor)
		.scrollContentBackground(.hidden)
	}
}

struct SubscriptionListView_Previews: PreviewProvider {
	static var previews: some View {
		SubscriptionListView()
			.environmentObject(Store())
	}
}

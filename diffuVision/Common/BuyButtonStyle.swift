//
//  BuyButtonStyle.swift
//  diffuVision
//
//  Created by İhsan Akbay on 21.06.2023.
//
import StoreKit
import SwiftUI

struct BuyButtonStyle: ButtonStyle {
	let isPurchased: Bool

	init(isPurchased: Bool = false) {
		self.isPurchased = isPurchased
	}

	func makeBody(configuration: Self.Configuration) -> some View {
		var bgColor: Color = isPurchased ? Color.green : Colors.buttonAndIconColor2.swiftUIColor
		bgColor = configuration.isPressed ? bgColor.opacity(0.7) : bgColor.opacity(1)

		return configuration.label
			.frame(width: 80)
			.padding(10)
			.background(bgColor)
			.clipShape(Capsule())
			.buttonStyle(.borderedProminent)
	}
}

struct BuyButtonStyle_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			Button(action: {}) {
				Text("Buy")
					.foregroundColor(.white)
					.bold()
			}
			.buttonStyle(BuyButtonStyle())
			.previewDisplayName("Normal")

			Button(action: {}) {
				Image(systemName: "checkmark")
					.foregroundColor(.white)
			}
			.buttonStyle(BuyButtonStyle(isPurchased: true))
			.previewDisplayName("Purchased")
		}
	}
}

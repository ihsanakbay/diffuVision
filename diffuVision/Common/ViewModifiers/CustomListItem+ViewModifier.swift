//
//  CustomListItem+ViewModifier.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.06.2023.
//

import SwiftUI

struct CustomListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(height: 42)
			.background(Colors.secondaryBackgroundColor.swiftUIColor)
			.cornerRadius(10)
			.padding([.horizontal], 16)
			.tint(Colors.textColor.swiftUIColor)
	}
}

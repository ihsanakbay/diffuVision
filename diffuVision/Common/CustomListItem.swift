//
//  CustomListItem.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.06.2023.
//

import SwiftUI

struct CustomListItem: View {
	let title: String
	let subtitle: String
	let action: () -> Void

	var body: some View {
		Button(action: action) {
			HStack {
				Text(title)
					.font(.subheadline)
					.padding(8)
				Spacer()
				Text(subtitle)
					.font(.subheadline)
					.lineLimit(1)
					.padding(8)
			}
		}
		.modifier(CustomListItemModifier())
	}
}

struct CustomListItem_Previews: PreviewProvider {
	static var previews: some View {
		CustomListItem(title: "Test", subtitle: "Subtitle", action: {})
	}
}

//
//  CustomImageItemButtonView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.05.2023.
//

import SwiftUI

struct CustomImageItemButtonView: View {
	let action: () -> Void
	let icon: String
	let label: String?
	let tintColor: Color
	let foregroundColor: Color

	var body: some View {
		Button(action: action) {
			if let label = label,
			   label != ""
			{
				Label(label, systemImage: icon)
			} else {
				Image(systemName: icon)
			}
		}
		.buttonStyle(.borderedProminent)
		.tint(tintColor)
		.foregroundColor(foregroundColor)
		.fontWeight(.medium)
		.shadow(color: Colors.shadowColor.swiftUIColor, radius: 10)
	}
}

struct CustomImageItemButtonView_Previews: PreviewProvider {
	static var previews: some View {
		CustomImageItemButtonView(action: {}, icon: Icons.Button.download.rawValue, label: "Save", tintColor: Colors.buttonAndIconColor.swiftUIColor, foregroundColor: .white)
	}
}

//
//  GeneratedImageButtonView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 9.06.2023.
//

import SwiftUI

struct GeneratedImageButtonView: View {
	var shareAction: () -> Void
	var saveAction: () -> Void

	var body: some View {
		HStack(alignment: .center, spacing: 10) {
			Spacer()
			CustomImageItemButtonView(action: shareAction,
			                          icon: Icons.Button.share.rawValue,
			                          label: "",
			                          tintColor: Color.white,
			                          foregroundColor: Colors.buttonAndIconColor.swiftUIColor)

			CustomImageItemButtonView(action: saveAction,
			                          icon: Icons.Button.download.rawValue,
			                          label: LocalizationStrings.save,
			                          tintColor: Colors.buttonAndIconColor.swiftUIColor,
			                          foregroundColor: .white)
		}
		.padding([.bottom, .trailing])
	}
}

struct GeneratedImageButtonView_Previews: PreviewProvider {
	static var previews: some View {
		GeneratedImageButtonView(shareAction: {}, saveAction: {})
	}
}

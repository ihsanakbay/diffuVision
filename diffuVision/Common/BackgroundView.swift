//
//  BackgroundView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 11.06.2023.
//

import SwiftUI

struct BackgroundView: View {
	var body: some View {
		LinearGradient(
			colors: [
				Colors.secondaryBackgroundColor.swiftUIColor,
				Colors.backgroundColor.swiftUIColor
			],
			startPoint: .topLeading,
			endPoint: .bottomTrailing)
			.ignoresSafeArea()
	}
}

struct BackgroundView_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundView()
	}
}

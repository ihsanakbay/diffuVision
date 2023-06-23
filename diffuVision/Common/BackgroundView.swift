//
//  BackgroundView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 11.06.2023.
//

import SwiftUI

struct BackgroundView: View {
	var body: some View {
		Colors.backgroundColor.swiftUIColor
			.ignoresSafeArea()
	}
}

struct BackgroundView_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundView()
	}
}

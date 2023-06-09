//
//  GeneratedImagePromptMessageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 8.06.2023.
//

import SwiftUI

struct GeneratedImagePromptMessageView: View {
	var text: String

	var body: some View {
		ZStack {
			Color.cardBackground

			VStack(spacing: 12) {
				Text(text)
					.padding(12)
					.font(.caption)
					.foregroundColor(.white)
					.textSelection(.enabled)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
		.cornerRadius(10)
		.shadow(color: Color.imageBackground, radius: 10)
	}
}

struct GlassCardView_Previews: PreviewProvider {
	static var previews: some View {
		GeneratedImagePromptMessageView(text: "Text test prompt message")
	}
}

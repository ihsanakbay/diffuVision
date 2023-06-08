//
//  GeneratedImageItemView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct GeneratedImageItemView: View {
	var model: GeneratedImageItemModel
	@State private var isShareSheetPresented = false

	var body: some View {
		VStack {
			if let response = model.response,
			   !response.artifacts.isEmpty,
			   let base64 = response.artifacts[0].base64
			{
				let imageData = "data:image/png;base64,\(base64)"
				let url = URL(string: imageData)

				// MARK: - Text prompt message

				GeneratedImagePromptMessageView(text: self.model.promtMessage ?? "")
					.shadow(color: Color.imageBackground, radius: 10)
					.padding([.bottom, .horizontal], 16)

				// MARK: - Image

				AsyncImage(url: url) { image in
					image
						.resizable()
						.scaledToFit()
						.cornerRadius(10)
						.shadow(color: Color.imageBackground, radius: 10)

				} placeholder: {
					ProgressView()
				}
				.padding([.horizontal], 8)

				// MARK: - Buttons

				GeneratedImageButtonView {
					showShareImage()
				} saveAction: {
					saveImageToGallery()
				}
			}
		}
		.sheet(isPresented: self.$isShareSheetPresented) {
			if let response = model.response,
			   !response.artifacts.isEmpty,
			   let base64 = response.artifacts[0].base64,
			   let imageData = Data(base64Encoded: base64),
			   let image = UIImage(data: imageData)
			{
				ShareSheetView(activityItems: [image])
			}
		}
	}
}

extension GeneratedImageItemView {
	private func saveImageToGallery() {
		if let response = model.response,
		   !response.artifacts.isEmpty,
		   let base64 = response.artifacts[0].base64,
		   let imageData = Data(base64Encoded: base64),
		   let image = UIImage(data: imageData)
		{
			let imageSaver = ImageSaver()
			imageSaver.writeToPhotoAlbum(image: image)
		}
	}

	private func showShareImage() {
		self.isShareSheetPresented.toggle()
	}
}

struct GeneratedImageItemView_Previews: PreviewProvider {
	static var previews: some View {
		GeneratedImageItemView(model: GeneratedImageItemModel())
	}
}

//
//  GeneratedImageItemView+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 24.06.2023.
//

import SwiftUI

extension GeneratedImageItemView {
	func saveImageToGallery() {
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

	func showShareImage() {
		self.isShareSheetPresented.toggle()
	}
}

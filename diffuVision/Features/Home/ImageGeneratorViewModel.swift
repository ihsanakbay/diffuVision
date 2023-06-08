//
//  HomePageViewModel.swift
//  diffuVision
//
//  Created by İhsan Akbay on 30.05.2023.
//

import Combine
import Foundation

@MainActor
final class HomePageViewModel: ObservableObject {
	@Published var request: APIParameters.TextToImageRequest = .init(cfgScale: 7, clipGuidancePreset: "FAST_BLUE", height: 512, width: 512, samples: 1, steps: 30, textPrompts: [])
	@Published var generatedImageItemModel: GeneratedImageItemModel = .init()
	@Published var isGenerating: Bool = false
	@Published var errorMessage: String = ""
	@Published var selectedSize: Size = .init(width: 512, height: 512)
	private var cancelable = Set<AnyCancellable>()

	func generateImage() {
		isGenerating = true
		request.width = selectedSize.width
		request.height = selectedSize.height

		ApiClient.dispatch(ApiRouter.GenerateImage(body: request))
			.sink { [weak self] completion in
				self?.isGenerating = false
				switch completion {
				case .finished:
					Log.info("Successfully generated image")
				case .failure(let error):
					Log.error("Unable to generate image \(error)")
					self?.errorMessage = error.localizedDescription
				}
			} receiveValue: { [weak self] response in
				self?.generatedImageItemModel.response = response
				self?.generatedImageItemModel.promtMessage = self?.request.textPrompts[0].text
			}
			.store(in: &cancelable)
	}
	
	func fetchEngineList() {
		
	}

	func setTextPrompt(prompt: APIParameters.TextPrompt) {
		request.textPrompts = [prompt]
	}
}

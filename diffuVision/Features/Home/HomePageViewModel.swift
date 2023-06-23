//
//  HomePageViewModel.swift
//  diffuVision
//
//  Created by İhsan Akbay on 30.05.2023.
//

import Combine
import SwiftUI

@MainActor
final class HomePageViewModel: ObservableObject {
	@Published var request: APIParameters.TextToImageRequest = .init()
	@Published var generatedImageItemModel: GeneratedImageItemModel = .init()
	@Published var isGenerating: Bool = false
	@Published var errorMessage: String = ""
	@Published var selectedSize: Size = .init(width: 512, height: 512)
	@Published var engines: [AIEngine] = .init()
	@Published var selectedEngineId: String = Constants.engineId
	private var cancelable = Set<AnyCancellable>()

	func generateImage() {
		isGenerating = true
		request.width = selectedSize.width
		request.height = selectedSize.height

		ApiClient.dispatch(ApiRouter.GenerateImage(body: request, engine: selectedEngineId))
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
		ApiClient.dispatch(ApiRouter.FetchEngineList())
			.sink { [weak self] completion in
				switch completion {
				case .finished:
					Log.info("Successfully fetched models")
				case .failure(let error):
					Log.error("Unable to fetched models \(error)")
					self?.errorMessage = error.localizedDescription
				}
			} receiveValue: { [weak self] response in
				self?.engines = response
			}
			.store(in: &cancelable)
	}

	func setTextPrompt(prompt: APIParameters.TextPrompt) {
		request.textPrompts = [prompt]
	}

	func showGeneratedImageItemView() -> Bool {
		guard let count = generatedImageItemModel.response?.artifacts.count,
		      count > 0 else { return false }
		return true
	}

	func getSelectedEngineIdName() -> String {
		guard let engine = engines.first(where: { $0.id == selectedEngineId }) else { return "" }
		return engine.name
	}

	func getSelectedSizeText() -> String {
		let size = selectedSize
		return "\(size.width) x \(size.height)"
	}

	func clearAll() {
		generatedImageItemModel.response = nil
	}

	func updatePremium(isPremium: Bool) async {
		if let user = try? AuthenticationManager.shared.getAuthenticatedUser() {
			do {
				try await UserManager.shared.updateUserPremiumStatus(userId: user.uid, isPremium: isPremium)
			} catch {
				errorMessage = error.localizedDescription
			}
		}
	}
	
	
}

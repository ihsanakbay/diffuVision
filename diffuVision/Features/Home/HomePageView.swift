//
//  HomePageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct HomePageView: View {
	@State private var prompt: String = ""
	@StateObject private var viewModel: HomePageViewModel = .init()

	var body: some View {
		ZStack {
			// MARK: - Size, Engine

			VStack {
				HStack {
					Text(LocalizationKeys.Keys.selectSize.rawValue.localizedString())
						.padding(8)
					Spacer()
					Picker("",
					       selection: $viewModel.selectedSize)
					{
						ForEach(Size.sizes, id: \.self) { size in
							Text("\(size.width) x \(size.height)")
						}
					}
					.pickerStyle(.navigationLink)
					.padding(8)
				}
				.modifier(CustomListItemModifier())

				HStack {
					Text(LocalizationKeys.Keys.selectEngine.rawValue.localizedString())
						.padding(8)
					Spacer()
					Picker("",
					       selection: $viewModel.selectedEngineId)
					{
						ForEach(viewModel.engines, id: \.id) { engine in
							Text("\(engine.name)")
						}
					}
					.pickerStyle(.navigationLink)
					.padding(8)
				}
				.modifier(CustomListItemModifier())

				// MARK: - Generated Image

				ScrollView(.vertical) {
					if true {
//					if viewModel.showGeneratedImageItemView() {
						GeneratedImageItemView(model: GeneratedImageItemModel(
							promtMessage: viewModel.generatedImageItemModel.promtMessage,
							response: viewModel.generatedImageItemModel.response))
							.padding()
					} else {
						EmptyView()
					}
				}

				// MARK: - Promt texr field and generate button

				PrompTextfieldView(prompt: $prompt) {
					viewModel.clearAll()
					viewModel.generateImage()
				}
			}
			.disabled(viewModel.isGenerating)
			.onAppear(perform: {
				viewModel.fetchEngineList()
			})
			.onChange(of: prompt) { newValue in
				viewModel.setTextPrompt(prompt: APIParameters.TextPrompt(text: newValue))
			}

			// MARK: - Activity Indicator

			if viewModel.isGenerating {
				ProgressView {
					Text(LocalizationKeys.Keys.generateImage.rawValue.localizedString())
						.foregroundColor(Color.labelColor.opacity(0.5))
				}
			} else { EmptyView() }
		}
	}
}

private struct CustomListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background(Color.secondarySystemBackground)
			.cornerRadius(10)
			.padding([.horizontal], 16)
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView()
	}
}

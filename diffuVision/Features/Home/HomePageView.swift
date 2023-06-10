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
					Text(LocalizationStrings.selectSize)
						.padding(8)
					Spacer()
					Picker("",
					       selection: $viewModel.selectedSize)
					{
						ForEach(Size.sizes, id: \.self) { size in
							Text("\(size.width) x \(size.height)")
						}
					}
					.pickerStyle(.menu)
					.padding(8)
				}
				.modifier(CustomListItemModifier())

				HStack {
					Text(LocalizationStrings.selectEngine)
						.padding(8)
					Spacer()
					Picker("", selection: $viewModel.selectedEngineId) {
						ForEach(viewModel.engines, id: \.id) { engine in
							Text("\(engine.name)")
						}
					}
					.pickerStyle(.menu)
					.padding(8)
				}
				.modifier(CustomListItemModifier())

				// MARK: - Generated Image

				ScrollView(.vertical) {
					if viewModel.showGeneratedImageItemView() {
						GeneratedImageItemView(model: GeneratedImageItemModel(
							promtMessage: viewModel.generatedImageItemModel.promtMessage,
							response: viewModel.generatedImageItemModel.response))
							.padding()
					} else {
						Text(LocalizationStrings.dashboardTitle)
							.multilineTextAlignment(.center)
							.padding(20)
					}
				}

				// MARK: - Promt texr field and generate button

				PrompTextfieldView(prompt: $prompt) {
					viewModel.clearAll()
					viewModel.generateImage()
					prompt = ""
				}
			}
			.foregroundColor(Colors.textColor.swiftUIColor)
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
					Text(LocalizationStrings.generateImage)
						.foregroundColor(Colors.textColor.swiftUIColor)
				}
				.tint(Colors.buttonColor.swiftUIColor)
			} else { EmptyView() }
		}
	}
}

private struct CustomListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.background(Colors.secondaryBackgroundColor.swiftUIColor)
			.cornerRadius(10)
			.padding([.horizontal], 16)
			.tint(Colors.textColor.swiftUIColor)
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView()
	}
}

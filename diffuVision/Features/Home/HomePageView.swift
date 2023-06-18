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

	@State private var isSizeSheetPresented = false
	@State private var isEngineSheetPresented = false

	var body: some View {
		ZStack {
			// MARK: - Size, Engine

			VStack {
				Button {
					isSizeSheetPresented = true
				} label: {
					Text(LocalizationStrings.selectSize)
						.font(.subheadline)
						.padding(8)
					Spacer()
					Text(viewModel.getSelectedSizeText())
						.font(.subheadline)
						.padding(8)
				}
				.modifier(CustomListItemModifier())

				Button {
					isEngineSheetPresented = true
				} label: {
					Text(LocalizationStrings.selectEngine)
						.font(.subheadline)
						.padding(8)
					Spacer()
					Text(viewModel.getSelectedEngineIdName())
						.font(.subheadline)
						.lineLimit(1)
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
				.tint(Colors.buttonAndIconColor.swiftUIColor)
			} else { EmptyView() }
		}
		.sheet(isPresented: $isSizeSheetPresented) {
			NavigationView {
				List {
					ForEach(Size.sizes, id: \.self) { size in
						HStack {
							Text("\(size.width) x \(size.height)")
							if size == viewModel.selectedSize {
								Spacer()
								Image(systemName: Icons.Button.checkmark.rawValue)
							}
						}
						.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
						.onTapGesture {
							viewModel.selectedSize = size
							isSizeSheetPresented = false
						}
					}
				}
				.navigationTitle(LocalizationStrings.selectSize)
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							isSizeSheetPresented.toggle()
						} label: {
							Text(LocalizationStrings.doneButton)
						}
					}
				}
				.scrollContentBackground(.hidden)
				.background(Colors.backgroundColor.swiftUIColor)
			}
			.presentationDetents([.medium])
		}
		.sheet(isPresented: $isEngineSheetPresented) {
			NavigationView {
				List {
					ForEach(viewModel.engines, id: \.id) { engine in
						HStack {
							Text("\(engine.name)")

							if engine.id == viewModel.selectedEngineId {
								Spacer()
								Image(systemName: Icons.Button.checkmark.rawValue)
							}
						}
						.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
						.onTapGesture {
							viewModel.selectedEngineId = engine.id
							isEngineSheetPresented = false
						}
					}
				}
				.navigationTitle(LocalizationStrings.selectEngine)
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							isEngineSheetPresented.toggle()
						} label: {
							Text(LocalizationStrings.doneButton)
						}
					}
				}
				.scrollContentBackground(.hidden)
				.background(Colors.backgroundColor.swiftUIColor)
			}
		}
	}
}

private struct CustomListItemModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(height: 42)
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

//
//  HomePageView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct HomePageView: View {
	@AppStorage(StorageKeys.reviewAsked.rawValue) var reviewAsked = false
	@AppStorage(StorageKeys.appStartCount.rawValue) var appStartCount: Int?

	@EnvironmentObject var store: Store
	@Environment(\.requestReview) var requestReview

	@StateObject var viewModel: HomePageViewModel = .init()

	@State private var isSizeSheetPresented = false
	@State private var isEngineSheetPresented = false
	@State private var isStyleSheetPresented = false
	@State private var showSubscriptionSheet = false
	@State private var isPremium = false
	@State private var isSubscribed: Bool = false

	var body: some View {
		ZStack {
			// MARK: - Size, Engine, Style

			VStack {
				CustomListItem(title: LocalizationStrings.selectSize,
				               subtitle: viewModel.getSelectedSizeText())
				{
					isSizeSheetPresented = true
				}

				CustomListItem(title: LocalizationStrings.selectEngine,
				               subtitle: viewModel.getSelectedEngineIdName())
				{
					isEngineSheetPresented = true
				}

				CustomListItem(title: LocalizationStrings.selectStyle,
				               subtitle: viewModel.getSelectedStyleName())
				{
					isStyleSheetPresented = true
				}

				// MARK: - Generated Image

				ScrollView(.vertical) {
					if viewModel.showGeneratedImageItemView() {
						GeneratedImageItemView(model: GeneratedImageItemModel(
							promtMessage: viewModel.generatedImageItemModel.promtMessage,
							response: viewModel.generatedImageItemModel.response))
							.padding()
					} else if !viewModel.isGenerating {
						Text(LocalizationStrings.dashboardTitle)
							.multilineTextAlignment(.center)
							.padding(20)
					}
				}

				// MARK: - Promt text field and generate button

				PrompTextfieldView(prompt: $viewModel.prompt) {
					if isPremium {
						viewModel.clearAll()
						viewModel.generateImage()
					} else {
						showSubscriptionSheet.toggle()
					}
				}
			}
			.foregroundColor(Colors.textColor.swiftUIColor)
			.disabled(viewModel.isGenerating)
			.onAppear(perform: {
				viewModel.fetchEngineList()
			})
			.onChange(of: viewModel.prompt) { newValue in
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
		.errorAlert(error: $viewModel.errorMessage)
		.sheet(isPresented: $isSizeSheetPresented) {
			SizeSheetView(isSizeSheetPresented: $isSizeSheetPresented)
				.environmentObject(viewModel)
		}
		.sheet(isPresented: $isEngineSheetPresented) {
			AIEngineSheetView(isEngineSheetPresented: $isEngineSheetPresented)
				.environmentObject(viewModel)
		}
		.sheet(isPresented: $isStyleSheetPresented) {
			StyleSheetView(isStyleSheetPresented: $isStyleSheetPresented)
				.environmentObject(viewModel)
		}
		.fullScreenCover(isPresented: $showSubscriptionSheet, onDismiss: {
			isPremium = store.purchasedSubscriptions.isEmpty ? false : true
			Task {
				await viewModel.updatePremium(isPremium: isPremium)
			}
		}) {
			SubscriptionSheetView(isSubscribed: $isSubscribed)
		}
		.onChange(of: store.purchasedSubscriptions, perform: { _ in
			Task {
				await store.updateCustomerProductStatus()
				isPremium = store.purchasedSubscriptions.isEmpty ? false : true
				await viewModel.updatePremium(isPremium: isPremium)
			}
		})
		.onChange(of: isSubscribed, perform: { _ in
			showSubscriptionSheet = false
		})
		.onAppear {
			Task {
				isPremium = store.purchasedSubscriptions.isEmpty ? false : true
				await viewModel.updatePremium(isPremium: isPremium)
			}

			if let count = appStartCount, count > 3, reviewAsked != true {
				reviewAsked = true
				DispatchQueue.main.async {
					requestReview()
				}
			}
		}
	}
}

struct HomePageView_Previews: PreviewProvider {
	static var previews: some View {
		HomePageView()
			.environmentObject(Store())
	}
}

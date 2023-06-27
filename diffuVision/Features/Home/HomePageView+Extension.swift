//
//  HomePageView+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.06.2023.
//

import SwiftUI

extension HomePageView {
	// MARK: Select Size

	struct SizeSheetView: View {
		@Binding var isSizeSheetPresented: Bool
		@EnvironmentObject var viewModel: HomePageViewModel

		var body: some View {
			NavigationView {
				List {
					ForEach(Size.sizes, id: \.self) { size in
						Button(action: {
							viewModel.selectedSize = size
							isSizeSheetPresented = false
						}, label: {
							HStack {
								Text("\(size.width) x \(size.height)")
								if size == viewModel.selectedSize {
									Spacer()
									Image(systemName: Icons.Button.checkmark.rawValue)
								}
							}
						})
						.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
						.foregroundColor(Colors.textColor.swiftUIColor)
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
	}

	// MARK: Select AI Engine

	struct AIEngineSheetView: View {
		@Binding var isEngineSheetPresented: Bool
		@EnvironmentObject var viewModel: HomePageViewModel

		var body: some View {
			NavigationView {
				List {
					ForEach(viewModel.engines, id: \.id) { engine in
						Button(action: {
							viewModel.selectedEngineId = engine.id
							isEngineSheetPresented = false
						}, label: {
							HStack {
								Text("\(engine.name)")

								if engine.id == viewModel.selectedEngineId {
									Spacer()
									Image(systemName: Icons.Button.checkmark.rawValue)
								}
							}
						})
						.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
						.foregroundColor(Colors.textColor.swiftUIColor)
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

	// MARK: Select Style Preset

	struct StyleSheetView: View {
		@Binding var isStyleSheetPresented: Bool
		@EnvironmentObject var viewModel: HomePageViewModel

		var body: some View {
			NavigationView {
				List {
					ForEach(StylePreset.presets, id: \.id) { style in
						Button(action: {
							viewModel.selectedStyle = style
							isStyleSheetPresented = false
						}, label: {
							HStack {
								Text("\(style.name)")
								if style == viewModel.selectedStyle {
									Spacer()
									Image(systemName: Icons.Button.checkmark.rawValue)
								}
							}
						})
						.listRowBackground(Colors.secondaryBackgroundColor.swiftUIColor)
						.foregroundColor(Colors.textColor.swiftUIColor)
					}
				}
				.navigationTitle(LocalizationStrings.selectSize)
				.navigationBarTitleDisplayMode(.inline)
				.toolbar {
					ToolbarItem(placement: .navigationBarTrailing) {
						Button {
							isStyleSheetPresented.toggle()
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

	// MARK: Subscription

	struct SubscriptionSheetView: View {
		@Environment(\.dismiss) var dismiss
		@Binding var isSubscribed: Bool

		var body: some View {
			NavigationView {
				SubscriptionListView(isSubscribed: $isSubscribed)
					.navigationBarTitleDisplayMode(.inline)
					.navigationTitle(LocalizationStrings.subscriptions)
					.toolbar {
						ToolbarItem(placement: .navigationBarTrailing) {
							Button {
								dismiss()
							} label: {
								Text(LocalizationStrings.doneButton)
							}
						}
					}
			}
			.presentationDetents([.medium, .large])
		}
	}
}

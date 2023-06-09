//
//  PrompTextfieldView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.05.2023.
//

import SwiftUI

struct PrompTextfieldView: View {
	@Binding var prompt: String
	@FocusState private var promptTextFieldFocused: Bool
	let action: () -> Void

	var body: some View {
		VStack {
			HStack {
				// MARK: - Prompt textfield

				TextField(LocalizationStrings.prompt,
				          text: $prompt.max(300),
				          axis: .vertical)
					.foregroundColor(.labelColor)
					.padding(8)
					.background(Color.secondarySystemBackground)
					.cornerRadius(10)
					.padding(.horizontal)
					.focused($promptTextFieldFocused)
					.toolbar {
						ToolbarItemGroup(placement: .keyboard) {
							Spacer()
							Button("Done") {
								promptTextFieldFocused = false
							}
						}
					}

				// MARK: - Button

				Button(action: action) {
					Image(systemName: Icons.Button.send.rawValue)
						.foregroundColor(.white)
				}
				.disabled(prompt.isEmpty)
				.buttonStyle(.borderedProminent)
				.clipShape(Circle())
				.padding(.trailing)
			}
			.padding(.bottom)
		}
	}
}

struct PrompTextfieldView_Previews: PreviewProvider {
	static var previews: some View {
		PrompTextfieldView(prompt: .constant(""), action: {})
	}
}

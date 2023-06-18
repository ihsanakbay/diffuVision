//
//  OnboardingView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 10.06.2023.
//

import AuthenticationServices
import RiveRuntime
import SwiftUI

struct OnboardingView: View {
	@StateObject private var vm: OnboardingViewModel = .init()
	private var background = RiveViewModel(fileName: "BackgroundAnimation")

	var body: some View {
		ZStack {
			background
				.view()
				.ignoresSafeArea()
				.blur(radius: 50)

			VStack(alignment: .center, spacing: 20) {
				Spacer()
				Text(LocalizationStrings.appTitle)
					.font(.largeTitle)
					.bold()
					.multilineTextAlignment(.center)
					.foregroundColor(Colors.textColor.swiftUIColor)

				Text(LocalizationStrings.appDescription)
					.font(.title)
					.multilineTextAlignment(.center)
					.foregroundColor(Colors.textColor.swiftUIColor)

				Text(LocalizationStrings.onboardMessage)
					.font(.title2)
					.multilineTextAlignment(.center)
					.foregroundColor(Colors.textColor.swiftUIColor)

				Button {
					Task {
						try await vm.signInWithApple()
					}
				} label: {
					SignInWithAppleButtonViewRepresentable(type: .default, style: .white)
						.allowsHitTesting(false)
				}
				.frame(height: 55)
				.clipShape(Capsule())
				.shadow(color: Colors.shadowColor.swiftUIColor, radius: 10)
				.padding()
			}
			.padding(30)
		}
		.errorAlert(error: $vm.errorMessage)
	}

	private func auth() throws {
		throw NetworkRequestError.badRequest
	}
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}

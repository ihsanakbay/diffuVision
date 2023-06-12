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

				SignInWithAppleButton(.signIn,
									  onRequest: vm.configure,
									  onCompletion: vm.handleSignInWithApple)
					.signInWithAppleButtonStyle(.white)
					.frame(height: 40)
					.shadow(color: Colors.shadowColor.swiftUIColor, radius: 10)
					.padding()

//				Button {
//					vm.test()
//				} label: {
//					Text(LocalizationStrings.getStarted)
//						.frame(width: Constants.screenWidth * 0.6)
//						.padding(8)
//				}
//				.buttonStyle(.borderedProminent)
//				.clipShape(Capsule())
//				.tint(Colors.buttonAndIconColor.swiftUIColor)
//				.foregroundColor(.white)
//				.fontWeight(.medium)
//				.shadow(color: Colors.shadowColor.swiftUIColor, radius: 10)
		
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

//
//  OnboardingView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 10.06.2023.
//

import RiveRuntime
import SwiftUI

struct OnboardingView: View {
	@AppStorage(AppStorageKeys.isOnboarding.rawValue) var isOnboarding: Bool?

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
					isOnboarding = false
				} label: {
					Text(LocalizationStrings.getStarted)
						.frame(width: Constants.screenWidth * 0.6)
						.padding(8)
				}
				.buttonStyle(.borderedProminent)
				.clipShape(Capsule())
				.tint(Colors.buttonColor.swiftUIColor)
				.foregroundColor(.white)
				.fontWeight(.medium)
				.shadow(color: Colors.shadowColor.swiftUIColor, radius: 10)
			}
			.padding(30)
		}
	}
}

struct OnboardingView_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingView()
	}
}

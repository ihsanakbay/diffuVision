//
//  View+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 12.06.2023.
//

import SwiftUI

extension View {
	@MainActor
	func errorAlert(error: Binding<Error?>, buttonTitle: String = "OK") -> some View {
		let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
		return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
			Button(buttonTitle) {
				error.wrappedValue = nil
			}
		} message: { error in
			Text(error.recoverySuggestion ?? "")
		}
	}
}

struct LocalizedAlertError: LocalizedError {
	let underlyingError: LocalizedError
	var errorDescription: String? {
		underlyingError.errorDescription
	}

	var recoverySuggestion: String? {
		underlyingError.recoverySuggestion
	}

	init?(error: Error?) {
		guard let localizedError = error as? LocalizedError else { return nil }
		underlyingError = localizedError
	}
}

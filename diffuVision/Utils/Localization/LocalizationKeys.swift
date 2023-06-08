//
//  LocalizationKeys.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct LocalizationKeys {
	enum Keys: String {
		case appTitle
		case tabSettings
		case save
		case share
		case regenerate
		case prompt
		case error
		case unreachableError
		case selectSize
		case selectEngine
		case generateImage
	}
}

extension String {
	func localizedString() -> LocalizedStringKey {
		return LocalizedStringKey(self)
	}
}

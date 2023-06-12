//
//  Icons.swift
//  diffuVision
//
//  Created by İhsan Akbay on 23.05.2023.
//

import SwiftUI

struct Icons {
	enum TabView: String {
		case imageTab = "wand.and.stars"
		case settingsTab = "gearshape.fill"

		var image: Image {
			return Image(systemName: self.rawValue)
		}
	}

	enum Button: String {
		case download = "square.and.arrow.down"
		case share = "square.and.arrow.up"
		case regenerate = "arrow.triangle.2.circlepath"
		case send = "paperplane.fill"

		case policy = "exclamationmark.shield.fill"
		case feedback = "quote.bubble.fill"
		case premium = "crown.fill"
		case checkmark

		var image: Image {
			return Image(systemName: self.rawValue)
		}
	}

	enum General: String {
		case xMark = "xmark.octagon"

		var image: Image {
			return Image(systemName: self.rawValue)
		}
	}
}

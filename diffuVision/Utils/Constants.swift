//
//  Constants.swift
//  diffuVision
//
//  Created by İhsan Akbay on 29.05.2023.
//

import SwiftUI

struct Constants {
	static let screenWidth = UIScreen.main.bounds.width
	static let screenHeight = UIScreen.main.bounds.height
	static let engineId = "stable-diffusion-512-v2-1"
	static let privacyPolicyLink = "https://docs.google.com/document/d/1FzMSoGiZt1UsHCWr8qn-VZR1OXRVfHx-AWA7abwSKys/edit?usp=sharing"
}

enum StorageKeys: String {
	case sharedGroup
	case isAuthenticated
	case appleUser
	case appStartCount
}

enum DefaultValues {
	static let height = 512
	static let width = 512
	static let cfgScale = 7
	static let samples = 1
	static let steps = 50
}

enum ClipGuidancePreset: String, Equatable, Hashable {
	case NONE
	case FAST_BLUE
	case FAST_GREEN
	case SIMPLE
	case SLOW
	case SLOWER
	case SLOWEST
}

enum StylePresets: String, Equatable, Hashable {
	case dModel = "3d-model"
	case analogFilm = "analog-film"
	case anime
	case cinematic
	case comicBook = "comic-book"
	case digitalArt = "digital-art"
	case enhance
	case fantasyArt = "fantasy-art"
	case isometric
	case lineArt = "line-art"
	case lowPoly = "low-poly"
	case modelingCompound = "modeling-compound"
	case neonPunk = "neon-punk"
	case origami
	case photographic
	case pixelArt = "pixel-art"
	case tileTexture = "tile-texture"
}

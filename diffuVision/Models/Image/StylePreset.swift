//
//  StylePreset.swift
//  diffuVision
//
//  Created by İhsan Akbay on 26.06.2023.
//

import Foundation

struct StylePreset: Equatable, Hashable {
	let id: String
	let name: String
}

extension StylePreset {
	static let presets: [StylePreset] = [
		StylePreset(id: "none", name: "None"),
		StylePreset(id: "3d-model", name: "3d Model"),
		StylePreset(id: "analog-film", name: "Analog Film"),
		StylePreset(id: "anime", name: "Anime"),
		StylePreset(id: "cinematic", name: "Cinematic"),
		StylePreset(id: "comic-book", name: "Comic Book"),
		StylePreset(id: "digital-art", name: "Digital Art"),
		StylePreset(id: "enhance", name: "Enhance"),
		StylePreset(id: "fantasy-art", name: "Fantasy Art"),
		StylePreset(id: "isometric", name: "Isometric"),
		StylePreset(id: "line-art", name: "Line Art"),
		StylePreset(id: "low-poly", name: "Low Poly"),
		StylePreset(id: "modeling-compound", name: "Modeling Compound"),
		StylePreset(id: "neon-punk", name: "Neon Punk"),
		StylePreset(id: "origami", name: "Origami"),
		StylePreset(id: "photographic", name: "Photographic"),
		StylePreset(id: "pixel-art", name: "Pixel Art"),
		StylePreset(id: "tile-texture", name: "Title Texture")
	]

	enum StylePresets: String, Equatable, Hashable {
		case none
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
}

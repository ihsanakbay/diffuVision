//
//  TextToImageResponse.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.05.2023.
//

import Foundation

struct TextToImageResponse: Codable {
	var artifacts: [Artifact]

	enum CodingKeys: String, CodingKey {
		case artifacts
	}
}

// MARK: - Artifact

struct Artifact: Codable {
	var base64: String?
	var seed: Int?
	var finishReason: String?

	enum CodingKeys: String, CodingKey {
		case base64
		case seed
		case finishReason
	}
}

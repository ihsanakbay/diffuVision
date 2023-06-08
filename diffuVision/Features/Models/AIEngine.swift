//
//  AIEngine.swift
//  diffuVision
//
//  Created by İhsan Akbay on 4.06.2023.
//

import Foundation

struct AIEngine: Codable, Identifiable {
	var id: String
	var description: String
	var name: String
	var type: String

	enum CodingKeys: String, CodingKey {
		case id
		case description
		case name
		case type
	}
}

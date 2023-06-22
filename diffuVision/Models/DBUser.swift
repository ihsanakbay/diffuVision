//
//  DBUser.swift
//  diffuVision
//
//  Created by İhsan Akbay on 18.06.2023.
//

import Foundation

struct DBUser: Codable {
	let uid: String
	let email: String?
	let name: String?
	let createdDate: Date?
	let isPremium: Bool?

	init(auth: AuthDataResultModel) {
		self.uid = auth.uid
		self.email = auth.email
		self.name = auth.name
		self.createdDate = Date()
		self.isPremium = false
	}

	enum CodingKeys: String, CodingKey {
		case uid
		case email
		case name
		case createdDate = "created_date"
		case isPremium = "is_premium"
	}

	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.uid, forKey: .uid)
		try container.encodeIfPresent(self.email, forKey: .email)
		try container.encodeIfPresent(self.name, forKey: .name)
		try container.encodeIfPresent(self.createdDate, forKey: .createdDate)
		try container.encodeIfPresent(self.isPremium, forKey: .isPremium)
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.uid = try container.decode(String.self, forKey: .uid)
		self.email = try container.decodeIfPresent(String.self, forKey: .email)
		self.name = try container.decodeIfPresent(String.self, forKey: .name)
		self.createdDate = try container.decodeIfPresent(Date.self, forKey: .createdDate)
		self.isPremium = try container.decodeIfPresent(Bool.self, forKey: .isPremium)
	}
}

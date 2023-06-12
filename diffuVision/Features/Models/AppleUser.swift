//
//  AppleUser.swift
//  diffuVision
//
//  Created by İhsan Akbay on 12.06.2023.
//

import AuthenticationServices
import Foundation

struct AppleUser: Codable {
	let userId: String
	let firstName: String
	let lastName: String
	let email: String

	init?(credentials: ASAuthorizationAppleIDCredential) {
		guard let firstName = credentials.fullName?.givenName,
		      let lastName = credentials.fullName?.familyName,
		      let email = credentials.email else { return nil }

		self.userId = credentials.user
		self.firstName = firstName
		self.lastName = lastName
		self.email = email
	}
}

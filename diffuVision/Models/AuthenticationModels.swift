//
//  AuthenticationModels.swift
//  diffuVision
//
//  Created by İhsan Akbay on 17.06.2023.
//

import FirebaseAuth
import Foundation

struct SignInWithAppleResult {
	let token: String
	let nonce: String
	let name: String
	let email: String
}

struct AuthDataResultModel {
	let uid: String
	let email: String?
	let name: String?

	init(user: User) {
		self.uid = user.uid
		self.email = user.email
		self.name = user.displayName
	}
}

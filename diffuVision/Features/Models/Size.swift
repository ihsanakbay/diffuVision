//
//  Size.swift
//  diffuVision
//
//  Created by İhsan Akbay on 4.06.2023.
//

import Foundation

struct Size: Equatable, Hashable {
	let width: Int
	let height: Int
}

extension Size {
	static let sizes: [Size] = [
		Size(width: 256, height: 256),
		Size(width: 512, height: 512),
		Size(width: 768, height: 768),
		Size(width: 1024, height: 1024)
	]
}

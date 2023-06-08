//
//  Binding+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 27.05.2023.
//

import SwiftUI

extension Binding where Value == String {
	func max(_ limit: Int) -> Self {
		if self.wrappedValue.count > limit {
			DispatchQueue.main.async {
				self.wrappedValue = String(self.wrappedValue.dropLast())
			}
		}
		return self
	}
}

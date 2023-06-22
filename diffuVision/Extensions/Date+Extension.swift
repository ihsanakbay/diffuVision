//
//  Date+Extension.swift
//  diffuVision
//
//  Created by İhsan Akbay on 21.06.2023.
//

import Foundation

extension Date {
	func formattedDate() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM dd, yyyy"
		return dateFormatter.string(from: self)
	}
}

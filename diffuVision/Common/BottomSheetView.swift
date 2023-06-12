//
//  BottomSheetView.swift
//  diffuVision
//
//  Created by İhsan Akbay on 11.06.2023.
//

import SwiftUI

struct BottomSheetView: View {
	var content: AnyView

	var body: some View {
		List {
			content
		}
	}
}

struct BottomSheetView_Previews: PreviewProvider {
	static var previews: some View {
		BottomSheetView(content: AnyView(Text("")))
	}
}

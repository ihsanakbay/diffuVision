//
//  Webview.swift
//  diffuVision
//
//  Created by İhsan Akbay on 11.06.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
	let url: URL

	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}

	func updateUIView(_ webView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		webView.load(request)
	}
}

//
//  WebView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
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

//
//  WebView.swift
//  DioMovies
//
//  Created by Diogenes de Souza Negreiros on 31/05/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = UIColor.darkGray
        webView.scrollView.backgroundColor = UIColor.darkGray
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.load(URLRequest(url: url))
    }
}

#Preview {
    WebView(url: URL(string: "https://www.youtube.com/embed/YoHD9XEInc0?autoplay=1")!)
        .frame(height: 300)
}


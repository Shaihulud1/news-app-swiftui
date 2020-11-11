//
//  WebView.swift
//  news-app-swiftui
//
//  Created by Илья Дернов on 11.11.2020.
//

import Foundation
import WebKit
import SwiftUI


struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView();
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

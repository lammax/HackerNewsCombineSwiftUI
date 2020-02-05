//
//  WebviewUI.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct  WebviewUI: UIViewRepresentable {
    
    var url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = self.url else { return WKWebView.pageNotFoundView() }
        
        let wkWebView = WKWebView()
        wkWebView.load(URLRequest(url: url))
        
        return wkWebView
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebviewUI>) {
        
    }
}

//
//  WKWebView+adds.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {
    
    static func pageNotFoundView() -> WKWebView {
        
        let pageNotFound: String = "<html><body><h1>Page not Found</h1></body></html>"
        let wk = WKWebView()
        wk.loadHTMLString(pageNotFound, baseURL: nil)
        return wk
        
    }
    
}

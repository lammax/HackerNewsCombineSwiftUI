//
//  Constants.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 04.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation

struct Constants {
    
    enum Stories: String {
        case topstories
        case newstories
        case beststories
    }
    
    struct URLs {
        private let baseURL: String = "https://hacker-news.firebaseio.com/v0/"
        var weather: String = ""
        let urlRemain: String = ".json?print=pretty"
        
        init(kind: Stories) {
            weather += baseURL
            weather += "\(kind)"
            weather += urlRemain
        }
    }
    
}

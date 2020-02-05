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
    
    //https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty
    //https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty
    
    struct URLs {
        private let baseURL: String = "https://hacker-news.firebaseio.com/v0/"
        private let urlRemain: String = ".json?print=pretty"
        
        init() {
        }
        
        func storyListURL(kind: Stories) -> String {
            return baseURL + "\(kind)" + urlRemain
        }

        func storyURL(id: Int?) -> String {
            return baseURL + "item/\(id ?? -1)" + urlRemain
        }
        
    }
    
}

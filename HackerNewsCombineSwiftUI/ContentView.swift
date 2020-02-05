//
//  ContentView.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 04.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    let net: NetManager = NetManager.sharedInstance
    
    var body: some View {
        Text("Hello, World!")
        List {
            self.net.fetchNews()
            .catch { _ in Just([0]) }
            .map { stories in
                return stories.map { id in
                    Text("\(id)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

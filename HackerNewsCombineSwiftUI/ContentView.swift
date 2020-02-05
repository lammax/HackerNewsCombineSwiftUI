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
    
    @ObservedObject var storyViewModels: StoryListViewModel = StoryListViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            List {
                Text("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

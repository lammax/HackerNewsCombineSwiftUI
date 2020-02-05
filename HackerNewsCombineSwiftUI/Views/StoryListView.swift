//
//  StoryListView.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI
import Combine

struct StoryListView: View {
    
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            
            List(self.storyListVM.storiesVM) { storyVM in
                NavigationLink(destination: StoryDetailView(story: storyVM.story )) {
                    Text("\(storyVM.title)")
                }
                .font(.body)
            }
            
        .navigationBarTitle("Hacker News")
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

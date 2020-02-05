//
//  StoryListViewModel.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    @Published var storiesVM: [StoryViewModel] = []
    
    private var cancellable: AnyCancellable?
    private let net: NetManager = NetManager.sharedInstance
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        self.cancellable = self.net.fetchNews(kind: .topstories)
        .catch { _ in Just([Story()]) }
        .map { stories in
            stories.map { StoryViewModel(story: $0) }
        }.sink(receiveValue: { storyViewModels in
            self.storiesVM = storyViewModels
        })
    }
    
}

struct StoryViewModel: Identifiable {
    
    let story: Story
    
    var id: Int {
        return story.id ?? 0
    }
    
    var title: String {
        return story.title ?? "N/A"
    }
    
    var url: URL? {
        if let urlAddress = story.url {
            return URL(string: urlAddress)
        } else {
            return nil
        }
    }
    
}

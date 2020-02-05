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
    
    @Published var stories: [StoryViewModel] = []
    
    private var cancellable: AnyCancellable?
    private let net: NetManager = NetManager.sharedInstance
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        self.cancellable = self.net.fetchNews()
        .catch { _ in Just([0]) }
        .map { storyIds in
            storyIds.map { StoryViewModel(id: $0) }
        }.sink(receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
    }
    
}

struct StoryViewModel {
    
    let id: Int
    
}

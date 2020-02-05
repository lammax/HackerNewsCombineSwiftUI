//
//  StoryDetailViewModel.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import Combine

class StoryDetailViewModel: ObservableObject {
    
    var storyId: Int
    
    private let net: NetManager = NetManager.sharedInstance
    
    private var cancellable: AnyCancellable?
    
    @Published private var story: Story!
    
    init(storyId: Int) {
        self.storyId = storyId
        
        self.cancellable = net.getStory(by: self.storyId).sink(receiveCompletion: { _ in }) { story in
            self.story = story
        }
        
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
    
}

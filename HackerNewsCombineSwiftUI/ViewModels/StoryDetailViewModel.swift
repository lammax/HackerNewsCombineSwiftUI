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
    
    private var storyId: Int?
    
    private let net: NetManager = NetManager.sharedInstance
    
    private var cancellable: AnyCancellable?
    
    @Published private var story: Story!
    
    init(with storyId: Int?) {
        self.storyId = storyId
        
        if let id = self.storyId {
            self.cancellable = net.getStory(by: id).sink(receiveCompletion: { _ in }) { story in
                self.story = story
            }
        }
        
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        return self.story?.title ?? "No title"
    }
    
    var text: String {
        return self.story?.text ?? "No text"
    }
    
    var url: String {
        return self.story?.url ?? "No url"
    }
    
}

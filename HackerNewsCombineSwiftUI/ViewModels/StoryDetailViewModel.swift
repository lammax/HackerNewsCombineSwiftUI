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
    
    
    private var cancellable: AnyCancellable?
    
    @Published private var story: Story?
    
    init(with story: Story?) {
        self.story = story
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        return self.story?.title ?? ""
    }
    
    var text: String {
        return self.story?.text ?? ""
    }
    
    var url: URL? {
        if let urlAddress = self.story?.url {
            return URL(string: urlAddress)
        } else {
            return nil
        }
    }
    
}

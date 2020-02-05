//
//  StoryDetailView.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 05.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import SwiftUI
import Combine

struct StoryDetailView: View {
    
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    
    init(storyId: Int? = nil) {
        
        self.storyDetailVM = StoryDetailViewModel(with: storyId)
        
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
            Text(self.storyDetailVM.text)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(storyId: 8863)
    }
}
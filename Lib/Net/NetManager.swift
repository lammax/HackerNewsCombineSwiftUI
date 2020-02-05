//
//  NetManager.swift
//  HackerNewsCombineSwiftUI
//
//  Created by Mac on 04.02.2020.
//  Copyright © 2020 Lammax. All rights reserved.
//

import Foundation
import Combine

class NetManager {
    
    static let sharedInstance = NetManager()
    
    private let session = URLSession.shared
    
    func fetchNews(kind: Constants.Stories) -> AnyPublisher<[Story], Error> {
        
        guard let url = URL(string: Constants.URLs().storyListURL(kind: kind)) else { fatalError("Invalid stories URL!")  }
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: stories.self, decoder: JSONDecoder())
            .flatMap { self.mergeStories(with: $0) }
            .scan([], { $0 + [$1] })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
    func getStory(by id: Int?) -> AnyPublisher<Story, Error> {
        
        guard let url = URL(string: Constants.URLs().storyURL(id: id)) else { fatalError("Invalid story URL!") }
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .catch { _ in Empty<Story, Error>() }
            .eraseToAnyPublisher()
        
    }
    
    private func mergeStories(with iDs: stories) -> AnyPublisher<Story, Error> {
        let storyIDs = Array(iDs.prefix(50))
        
        let initialPublisher = getStory(by: storyIDs.first)
        let reminder = Array(storyIDs.dropFirst())
        
        return reminder.reduce(initialPublisher) { acc, id in
            return acc.merge(with: getStory(by: id)).eraseToAnyPublisher()
        }
    }
    
}

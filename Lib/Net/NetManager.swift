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
    
    func fetchNews(kind: Constants.Stories) -> AnyPublisher<stories, Error> {
        
        guard let url = URL(string: Constants.URLs().storyListURL(kind: kind)) else { fatalError("Invalid stories URL!")  }
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: stories.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
    func getStory(by id: Int) -> AnyPublisher<Story, Error> {
        
        guard let url = URL(string: Constants.URLs().storyURL(id: id)) else { fatalError("Invalid story URL!") }
        
        return session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Story.self, decoder: JSONDecoder())
            .catch { _ in Empty<Story, Error>() }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}

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
    
    func fetchNews() -> AnyPublisher<stories, Error> {
        
        guard let url = URL(string: Constants.URLs(kind: .newstories).weather) else { fatalError("Invalid stories URL!") }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: stories.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
    }
    
}

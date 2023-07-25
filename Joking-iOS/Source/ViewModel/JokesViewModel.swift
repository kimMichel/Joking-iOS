//
//  JokesViewModel.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 25/07/23.
//

import Foundation

class JokesViewModel {
    
    private var service = JokesManager()
    
    func getJoke(category: String, completion: @escaping (Joke) -> Void) {
        
        service.fetchData(category: category) { joke, error in
            if let error = error {
                print(error)
                return
            }
            
            if let joke = joke {
                completion(joke)
            }
        }
    }
}

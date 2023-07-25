//
//  CategoryManager.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 24/07/23.
//

import Foundation

class CategoryManager {
    
    private let urlString = "https://api.chucknorris.io/jokes/categories"
    
    func fetchData(completion: @escaping ([String]?, String?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(nil, "Error: \(error)")
                return
            }
            
            guard let safeData = data else {
                completion(nil, "No data receive.")
                return
            }
            
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: safeData, options: []) as? [String] {
                    completion(jsonArray, nil)
                } else {
                    completion(nil, "Failed to parse JSON as an array of strings.")
                }
            } catch {
                completion(nil, "Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}

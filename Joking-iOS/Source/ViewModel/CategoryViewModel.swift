//
//  CategoryViewModel.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 24/07/23.
//

import Foundation

class CategoryViewModel {
    
    var service = CategoryManager()
    
    var categories = [String]()
    
    func getCategories(completion: @escaping () -> Void) {
        
        service.fetchData { [weak self] categories, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let categories = categories {
                for item in categories {
                    self?.categories.append(item)
                }
                completion()
            }
        }
    }
}

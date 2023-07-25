//
//  JokesViewController.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 25/07/23.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var jokeLabel: UILabel!
    
    var category: String?
    var viewModel = JokesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setCardView()
        fetch()
    }
    
    func setViews() {
        title = category?.capitalized
    }
    
    func setCardView() {
        self.cardView.layer.cornerRadius = 10
        
        
    }
    
    func fetch() {
        if let category = category {
            viewModel.getJoke(category: category) { [weak self] joke in
                self?.setJoke(joke: joke.value)
            }
        }
    }
    
    func setJoke(joke: String) {
        DispatchQueue.main.async {
            self.jokeLabel.text = joke
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

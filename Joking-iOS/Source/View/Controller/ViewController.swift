//
//  ViewController.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 24/07/23.
//

import UIKit

class ViewController: UITableViewController {
    
    private var viewModel = CategoryViewModel()
    var selectedCategory = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        viewModel.getCategories { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryTableViewCell
        let category = viewModel.categories[indexPath.row]
        cell.label.text = category.capitalized
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        
        selectedCategory = viewModel.categories[selectedRow]
        
        performSegue(withIdentifier: "goToJokesView", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToJokesView" {
            let destinationVC = segue.destination as! JokesViewController
            destinationVC.category = selectedCategory
        }
    }
}


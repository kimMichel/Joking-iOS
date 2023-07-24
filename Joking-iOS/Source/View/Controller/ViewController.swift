//
//  ViewController.swift
//  Joking-iOS
//
//  Created by Michel Jaejin Kim on 24/07/23.
//

import UIKit

class ViewController: UITableViewController {
    
    private var viewModel = CategoryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"
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
}


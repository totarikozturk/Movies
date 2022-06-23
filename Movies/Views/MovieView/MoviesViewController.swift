//
//  ViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 18.06.2022.
//

import UIKit

class MoviesViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let tableView = UITableView()
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateTableViewData()
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTableViewData()
    }

    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

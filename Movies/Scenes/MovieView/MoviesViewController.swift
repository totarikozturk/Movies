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
    private let viewModal = MoviesViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        updateTableViewData()
        loadSearchMoviesData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func loadSearchMoviesData() {
        viewModal.fetchSearchMoviesData {
            self.searchBar.delegate = self
        }
   }

}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModal.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.movieCell,
                                                       for: indexPath) as? MovieCell else { return UITableViewCell() }
        let movie = viewModal.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        let movie = viewModal.didSelectedRowAt(indexPath: indexPath)
        Singleton.movieDetailData = movie
        self.navigationController?.navigationBar.isHidden = false
        movieDetailViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }

}

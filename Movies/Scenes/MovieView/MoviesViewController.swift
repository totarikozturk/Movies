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
    let searchBar = UISearchController()
    private let viewModal = MoviesViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        updateTableViewData()
    }

    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        cell.selectionStyle = .none
        let movie = viewModal.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellSelect: UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath) else { return }
        cellSelect.selectionStyle = .none
        let movieDetailViewController = MovieDetailViewController()
        let movie = viewModal.didSelectedRowAt(indexPath: indexPath)
        Singleton.movieDetailData = movie
        self.navigationController?.navigationBar.isHidden = false
        movieDetailViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }

}

extension MoviesViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
                      text.trimmingCharacters(in: CharacterSet.whitespaces).count >= 1  else {return}
        viewModal.fetchSearchMoviesData(for: text) {
            self.tableView.reloadData()
        }
    }
}

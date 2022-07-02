//
//  MakeMovieView.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//
import UIKit
import SnapKit

extension MoviesViewController {

    func configureView() {
        drawDesign()
        navigationBarAppearance()
        makeSearchBar()
        makeTableView()
    }

    func drawDesign() {
        view.backgroundColor = .purple
        tableView.backgroundColor = .lightGray
        view.addSubview(tableView)
    }

    func makeSearchBar() {
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.searchBar.placeholder = "Enter the movie name"
        searchBar.searchResultsUpdater = self
        navigationItem.searchController = searchBar
    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 180
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.movieCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Movies"
        navigationController?.navigationBar.tintColor = .black
    }

}

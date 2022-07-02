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
        view.addSubview(tableView)
    }

    func makeSearchBar() {
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.searchBar.placeholder = "Enter the movie name"
        searchBar.searchResultsUpdater = self
        searchBar.searchBar.tintColor = CustomColor.textColor
        searchBar.searchBar.barTintColor = CustomColor.textColor
        searchBar.searchBar.searchTextField.textColor = CustomColor.textColor
    }

    func makeTableView() {
        tableView.backgroundColor = CustomColor.backGroundColor
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
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes  = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Movies you looking for ?"
        navigationItem.titleView?.tintColor = CustomColor.titleColor
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationItem.searchController = searchBar
    }

}

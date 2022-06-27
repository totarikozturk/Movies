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
        makeTableView()
        navigationBarAppearance()
    }

    func drawDesign() {
        view.backgroundColor = .purple
        tableView.backgroundColor = .lightGray
        view.addSubview(tableView)
        searchBar.sizeToFit()
        searchBar.delegate = self
    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
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
        showSearchBarButton(shouldShow: true)
    }

}

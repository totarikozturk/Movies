//
//  MovieTableView+Extension.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//

import UIKit

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCell.movieCell,
            for: indexPath) as? MovieCell else { return UITableViewCell() }
        cell.movieTitle.text = "title"
        cell.movieImage.image = UIImage(systemName: "display")
        cell.movieFavButton.setTitle("Fav", for: .normal)
        cell.movieFavButton.setTitleColor(UIColor.black, for: .normal)
        cell.textLabel?.textColor = .black
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.detailImage.image = UIImage(systemName: "display")
        movieDetailViewController.detailTitle.text = "title"
        movieDetailViewController.detailDesc.text = """
            Here we have created a second screen for our application.
            """
        self.navigationController?.navigationBar.isHidden = false
        movieDetailViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }

}

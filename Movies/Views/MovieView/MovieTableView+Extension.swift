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
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell, for: indexPath) as! MovieCell
        cell.movieTitle.text = "title"
        cell.movieImage.image = UIImage(systemName: "display")
        cell.movieFavButton.setTitle("Fav", for: .normal)
        cell.movieFavButton.setTitleColor(UIColor.black, for: .normal)
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.detailImage.image = UIImage(systemName: "display")
        movieDetailVC.detailTitle.text = "title"
        movieDetailVC.detailDesc.text = """
            Here we have created a second screen for our application. Now we will add components to our second screen, to show details of movies. We will add ImageView to display movie images and add Labels to show the title and release date. We will also add UIView to show ratings for movies and add TextView to show the details for movies.
            """
        self.navigationController?.navigationBar.isHidden = false
        movieDetailVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

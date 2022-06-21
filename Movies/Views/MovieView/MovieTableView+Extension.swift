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
    
}

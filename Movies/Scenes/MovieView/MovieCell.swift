//
//  MovieCell.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    static let movieCell = "MovieCell"
    private var movieDataForBookMark = Movie()
    private let viewModal = MoviesViewModal()

    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let movieYear = UILabel()
    let movieRate = UILabel()
    let movieFavButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func favButtonTapped(_ sender: UIButton) {
        Singleton.movieBookmarkData = movieDataForBookMark
        Singleton.favButtonTapped = true
    }

    func setCellWithValuesOf(_ movie: Movie) {
        updateUI(title: movie.title, releaseDate: movie.year,
                 rating: movie.rate, overView: movie.overview,
                 poster: movie.posterImage)
        movieDataForBookMark = movie
    }

    private func updateUI(title: String?, releaseDate: String?, rating: Double?,
                          overView: String?, poster: String?) {

        guard let posterString = poster else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        self.movieImage.kf.setImage(with: url)
        self.movieTitle.text = title
        self.movieYear.text = viewModal.convertDateFormatter(releaseDate)
        guard let rate = rating else { return }
        self.movieRate.text = String(rate)
        self.movieFavButton.setImage(UIImage(systemName: "star"), for: .normal)
        self.movieFavButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
    }

}

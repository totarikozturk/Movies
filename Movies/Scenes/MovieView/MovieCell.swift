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
    var movieDataForBookMark = Movie()
    private let viewModal = MoviesViewModal()
    private var bookMarkViewModal = BookMarksViewModal()
    private var bookVC = BookMarksViewController()

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
    // TODO: - bookmarksarray doesn't count
    @objc func favButtonTapped(_ sender: UIButton) {
        bookMarkViewModal.getBookMarksData(movie: movieDataForBookMark)
        let data = Movie(title: movieDataForBookMark.title,
                         year: movieDataForBookMark.year,
                         rate: movieDataForBookMark.rate,
                         posterImage: movieDataForBookMark.posterImage,
                         overview: movieDataForBookMark.overview)
        bookVC.bookMarksArray.append(data)
        bookVC.save()
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
        self.movieFavButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        self.movieFavButton.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
    }

}

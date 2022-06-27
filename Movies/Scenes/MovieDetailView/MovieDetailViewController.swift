//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    var detailImage = UIImageView()
    let detailTitle = UILabel()
    let detailYearTitle = UILabel()
    let detailYear = UILabel()
    let detailRateTitle = UILabel()
    let detailRate = UILabel()
    let detailDesc = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    func getDetailMovieData(movie: Movie) {
        updateDetailUI(title: movie.title,
                       releaseDate: movie.year,
                       rating: movie.rate,
                       overView: movie.overview,
                       poster: movie.posterImage)
    }

    func updateDetailUI(title: String?,
                        releaseDate: String?,
                        rating: Double?,
                        overView: String?,
                        poster: String?) {
        guard let posterString = poster else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        detailImage.kf.setImage(with: url)
        detailTitle.text = title
        detailYear.text = convertDate(releaseDate)
        guard let rate = rating else { return }
        detailRate.text = String(rate)
        detailDesc.text = overView
    }

    func convertDate(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }

}

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
    let detailView = UIView()
    private var viewModal = MovieDetailViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        updateDetailUI()
    }

    func updateDetailUI() {
        let movie = viewModal.movieData()
        guard let posterString = movie.posterImage else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        detailImage.kf.setImage(with: url)
        detailTitle.text = movie.title
        detailYear.text = viewModal.convertDate(movie.year)
        guard let rate = movie.rate else { return }
        detailRate.text = String(rate)
        detailDesc.text = movie.overview
    }

}

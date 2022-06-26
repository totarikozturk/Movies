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

    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let movieYear = UILabel()
//    let movieOverview = UILabel()
    let movieRate = UILabel()
    let movieFavButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCellWithValuesOf(_ movie: Movie) {
        updateUI(title: movie.title, releaseDate: movie.year,
                 rating: movie.rate, overView: movie.overview,
                 poster: movie.posterImage)
    }

    private func updateUI(title: String?, releaseDate: String?, rating: Double?,
                          overView: String?, poster: String?) {

        guard let posterString = poster else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        self.movieImage.kf.setImage(with: url)
        self.movieTitle.text = title
        self.movieYear.text = convertDateFormatter(releaseDate)
        guard let rate = rating else { return }
        self.movieRate.text = String(rate)
//        self.movieOverview.text = overView
        self.movieFavButton.setImage(UIImage(systemName: "star"), for: .normal)
    }

    func convertDateFormatter(_ date: String?) -> String {
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

    func configure() {
        drawDesign()
        makeMovieImage()
        makeMovieTitle()
        makeMovieYear()
//        makeMovieOverview()
        makeMovieRate()
        makeMovieFavButton()
    }

    func drawDesign() {
        contentView.backgroundColor = .lightGray
        backgroundColor = UIColor.lightGray
        addSubview(movieImage)
        addSubview(movieTitle)
        addSubview(movieYear)
//        addSubview(movieOverview)
        addSubview(movieRate)
        contentView.addSubview(movieFavButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10.0
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0,
                                                                               left: 0,
                                                                               bottom: bottomSpace,
                                                                               right: 0))
    }

    func makeMovieImage() {
        movieImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-300)
        }
    }

    func makeMovieTitle() {
        movieTitle.lineBreakMode = .byWordWrapping
        movieTitle.numberOfLines = 0
        movieTitle.textAlignment = .left
        movieTitle.minimumScaleFactor = 1
        movieTitle.adjustsFontSizeToFitWidth = true
        movieTitle.textColor = UIColor.black
        movieTitle.font = .boldSystemFont(ofSize: 24)
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.topMargin)
            make.left.equalTo(movieImage.snp.right).offset(8)
            make.right.equalToSuperview().offset(-60)
        }
    }

    func makeMovieYear() {
        movieYear.textColor = UIColor.black
        movieYear.font = .systemFont(ofSize: 20)
        movieYear.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottomMargin).offset(8)
            make.left.equalTo(movieImage.snp.right).offset(8)
        }
    }

//    func makeMovieOverview() {
//        movieOverview.lineBreakMode = .byTruncatingTail
//        movieOverview.numberOfLines = 0
//        movieOverview.textAlignment = .left
//        movieOverview.minimumScaleFactor = 1
//        movieOverview.adjustsFontSizeToFitWidth = true
//        movieOverview.textColor = UIColor.black
//        movieOverview.font = .systemFont(ofSize: 12)
//        movieOverview.snp.makeConstraints { make in
//            make.top.equalTo(movieYear.snp.bottomMargin).offset(48)
//            make.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
//            make.left.equalTo(movieImage.snp.right).offset(8)
//            make.right.equalToSuperview().offset(-40)
//        }
//    }

    func makeMovieRate() {
        movieRate.numberOfLines = 0
        movieRate.adjustsFontSizeToFitWidth = true
        movieRate.textColor = UIColor.black
        movieRate.font = .boldSystemFont(ofSize: 20)
        movieRate.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalTo(movieImage.snp.rightMargin).offset(16)
        }
    }

    func makeMovieFavButton() {
        movieFavButton.tintColor = UIColor.black
        movieFavButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview().offset(-16)
        }
    }

}

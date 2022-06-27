//
//  MakeMovieCellView.swift
//  Movies
//
//  Created by TarıkOzturk on 27.06.2022.
//

import UIKit

extension MovieCell {

    func configure() {
        drawDesign()
        makeMovieImage()
        makeMovieTitle()
        makeMovieYear()
        makeMovieRate()
        makeMovieFavButton()
    }

    func drawDesign() {
        contentView.backgroundColor = .lightGray
        backgroundColor = UIColor.lightGray
        addSubview(movieImage)
        addSubview(movieTitle)
        addSubview(movieYear)
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

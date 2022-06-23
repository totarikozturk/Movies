//
//  MovieCell.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//

import UIKit

class MovieCell: UITableViewCell {

    static let movieCell = "MovieCell"

    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let movieFavButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        drawDesign()
        makeMovieImage()
        makeMovieTitle()
        makeMovieFavButton()
    }

    func drawDesign() {
        contentView.backgroundColor = .lightGray
        backgroundColor = UIColor.lightGray
        addSubview(movieImage)
        addSubview(movieTitle)
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
            make.size.equalTo(CGSize(width: 112, height: 80))
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(8)
        }
    }

    func makeMovieTitle() {
        movieTitle.numberOfLines = 0
        movieTitle.adjustsFontSizeToFitWidth = true
        movieTitle.textColor = UIColor.black
        movieTitle.font = .boldSystemFont(ofSize: 20)
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(movieImage.snp.topMargin)
            //            make.bottom.equalToSuperview().offset(-42)
            make.left.equalTo(movieImage.snp.right).offset(8)
            make.height.equalTo(40)
        }
    }

    func makeMovieFavButton() {
        movieFavButton.tintColor = UIColor.black
        movieFavButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 30, height: 30))
            make.top.equalTo(movieTitle.snp.top).offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

}

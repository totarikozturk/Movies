//
//  BookMarkCell.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

class BookMarkCell: UITableViewCell {

    static let BookmarkCell = "BookmarkCell"

    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let movieYear = UILabel()
    let movieRate = UILabel()

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
        makeMovieYear()
        makeMovieRate()
    }

    func drawDesign() {
        backgroundColor = UIColor.lightGray
        addSubview(movieImage)
        addSubview(movieTitle)
        addSubview(movieYear)
        addSubview(movieRate)
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

}

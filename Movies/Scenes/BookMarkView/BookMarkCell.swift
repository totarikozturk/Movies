//
//  BookMarkCell.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

class BookMarkCell: UITableViewCell {

    static let BookmarkCell = CellIdent.bookmarkCell
    private let viewModal = BookMarksViewModal()

    let movieImage = UIImageView()
    let movieTitle = UILabel()
    let movieYear = UILabel()
    let movieRate = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("\(ErrorCode.fatalInitError)")
    }

    func setCellWithValuesOf(_ movie: Movie) {
        updateUI(title: movie.title, releaseDate: movie.year,
                 rating: movie.rate, overView: movie.overview,
                 poster: movie.posterImage)
    }

    private func updateUI(title: String?, releaseDate: String?, rating: Double?,
                          overView: String?, poster: String?) {

        guard let posterString = poster else { return }
        let url = URL(string: ApiKey.imageUrl + posterString)
        self.movieImage.kf.setImage(with: url)
        self.movieTitle.text = title
        self.movieYear.text = viewModal.convertDate(releaseDate)
        guard let rate = rating else { return }
        self.movieRate.text = String(rate)
    }

}

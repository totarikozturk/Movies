//
//  MovieDetailViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 28.06.2022.
//

import Foundation

struct MovieDetailViewModal {
    static var shared = MovieDetailViewModal()
    var movieDetailData = Movie()

    func getDetailMovieData(movie: Movie) {
        MovieDetailViewModal.shared.movieDetailData = movie
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

//
//  MovieDetailViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 28.06.2022.
//

import Foundation

struct MovieDetailViewModal {

    private var movies = Movie()

    mutating func movieData() -> Movie {
         self.movies = Singleton.movieDetailData
        return movies
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

//
//  SearchModal.swift
//  Movies
//
//  Created by TarıkOzturk on 1.07.2022.
//

import Foundation

struct SearchMovie: Codable {
    let results: [Search]
}

struct Search: Codable {

    let originalTitle, overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

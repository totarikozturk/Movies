//
//  Movies.swift
//  Movies
//
//  Created by TarıkOzturk on 23.06.2022.
//
import Foundation

struct MoviesData: Decodable {

    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable {

    var title: String?
    var year: String?
    var rate: Double?
    var posterImage: String?
    var overview: String?

    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }

}

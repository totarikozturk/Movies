//
//  GenreModal.swift
//  Movies
//
//  Created by TarıkOzturk on 29.06.2022.
//

import Foundation

struct GenreMovie: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}

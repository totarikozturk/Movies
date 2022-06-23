//
//  MoviesModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import UIKit

struct MoviesModal {
    let movieTitle: String
    let movieImage: UIImage
    let movieDesc: String

    init(
        movieTitle: String,
        movieImage: UIImage,
        movieDesc: String
    ) {
        self.movieTitle = movieTitle
        self.movieImage = movieImage
        self.movieDesc = movieDesc
    }
}

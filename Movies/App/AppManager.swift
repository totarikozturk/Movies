//
//  AppManager.swift
//  Movies
//
//  Created by TarıkOzturk on 30.06.2022.
//

import Foundation

class Singleton {

    static let shared = Singleton()
    static var movieDetailData = Movie()
    static var movieBookmarkData = Movie()
    static var favButtonTapped = false
    static var searchString: String?
    static var popularMovies = [Movie]()
}

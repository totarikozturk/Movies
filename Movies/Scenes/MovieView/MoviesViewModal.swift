//
//  MoviesViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import Foundation

class MoviesViewModal {

    private var popularMovies = Singleton.popularMovies
    private var apiGenreService = ApiGenreService()
    private var searchMovies = [Search]()
    private var movieSearchSucces: Bool = false

    func fetchSearchMoviesData(for completion: @escaping () -> Void) {

        apiGenreService.getSearchMoviesData { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.searchMovies = listOf.results
                completion()
                print(self?.searchMovies as Any)
            case.failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }

    func convertDateFormatter(_ date: String?) -> String {
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

    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }

    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }

    func didSelectedRowAt (indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }

}

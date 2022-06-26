//
//  MoviesViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import Foundation

class MoviesViewModal {

    private var apiService = ApiService()
    private var popularMovies = [Movie]()

    func fetchPopularMoviesData(completion: @escaping () -> Void) {

        apiService.getPopularMoviesData { [weak self] (result) in

            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case.failure(let error):
                print("Error processing json data: \(error)")
            }
        }
        print(self.popularMovies.count)
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

}

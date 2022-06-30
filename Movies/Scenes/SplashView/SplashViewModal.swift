//
//  SplashViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 30.06.2022.
//

import Foundation

class SplashViewModal {

    private var apiService = ApiService()
    private var popularMovies = [Movie]()

    func fetchMoviesData(completion: @escaping () -> Void) {

        apiService.getPopularMoviesData { [weak self] (result) in

            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case.failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }

}

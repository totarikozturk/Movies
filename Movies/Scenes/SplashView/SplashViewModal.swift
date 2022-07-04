//
//  SplashViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 30.06.2022.
//

import Foundation

class SplashViewModal {

    private var apiService = MovieService()

    func fetchMoviesData(completion: @escaping () -> Void) {

        apiService.getPopularMoviesData { (result) in

            switch result {
            case .success(let listOf):
                Singleton.popularMovies = listOf.movies
                completion()
            case.failure(let error):
                print("\(ErrorCode.errorProcessingJson) \(error)")
            }
        }
    }

}

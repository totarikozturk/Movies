//
//  ApiService.swift
//  Movies
//
//  Created by TarıkOzturk on 26.06.2022.
//

import Foundation

class ApiService {

    private var dataTask: URLSessionDataTask?

    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void ) {

        let popularMoviesURL = ApiKey.url

        guard let url = URL(string: popularMoviesURL) else { return }
        // Create URL Session - work on he background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handel error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }

            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code : \(response.statusCode)")

            guard let data = data else {
                // Handel Empty Data
                print("Empty Data")
                return
            }

            do {
                // Parse the data
                let deceoder = JSONDecoder()
                let jsonData = try deceoder.decode(MoviesData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }

}

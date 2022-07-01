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
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code : \(response.statusCode)")
            guard let data = data else {
                print("Empty Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
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

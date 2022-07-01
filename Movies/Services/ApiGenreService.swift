//
//  ApiGenreService.swift
//  Movies
//
//  Created by TarıkOzturk on 29.06.2022.
//

import Foundation

class ApiGenreService {

    private var dataTask: URLSessionDataTask?

    func getSearchMoviesData(for query: String, completion: @escaping (Result<SearchMovie, Error>) -> Void ) {
        let searchMoviesURL = ApiKey.searchUrl
        guard let url = URL(string: searchMoviesURL + query) else { return }
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
                let jsonData = try decoder.decode(SearchMovie.self, from: data)
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

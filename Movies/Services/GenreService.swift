//
//  ApiGenreService.swift
//  Movies
//
//  Created by TarıkOzturk on 29.06.2022.
//

import Foundation

class GenreService {

    private var dataTask: URLSessionDataTask?

    func getSearchMoviesData(for query: String, completion: @escaping (Result<MoviesData, Error>) -> Void ) {
        let searchMoviesURL = ApiKey.searchUrl
        guard let url = URL(string: searchMoviesURL + query) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("\(ErrorCode.dataTaskError) \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("\(ErrorCode.responseError)")
                return
            }
            print("\(ErrorCode.responseStatusCode) \(response.statusCode)")
            guard let data = data else {
                print("\(ErrorCode.emptyData)")
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

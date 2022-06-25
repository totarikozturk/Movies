//
//  ViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 18.06.2022.
//

import UIKit

class MoviesViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let movieDataLists = [MovieModal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateTableViewData()
        configureView()
        getData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTableViewData()
    }

    func updateTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func getData() {
        let session = URLSession.shared.dataTask(
            with: URL(string: APIKey.urlKey)!,
            completionHandler: {data, response, error in
                _ = response
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            var result: MovieModal?
            do {
                result = try JSONDecoder().decode(MovieModal.self, from: data)
            } catch {
                print("failed the convert \(error.localizedDescription)")
            }

            guard let json = result else { return }

            print(json.status)
            print(json.title)
            print(json.homepage)
                print(json.originalTitle)
                print(json.posterPath)
        })
            session.resume()
    }

}

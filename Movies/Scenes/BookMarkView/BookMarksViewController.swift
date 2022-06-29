//
//  BookMarksViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//
import UIKit

class BookMarksViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let tableView = UITableView()
    private var viewModal = BookMarksViewModal()
    var bookMarksArray = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateTableViewData()
    }

    func updateTableViewData() {
        DispatchQueue.main.async {
            self.load()
        }
    }

}

extension BookMarksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookMarksArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookMarkCell.BookmarkCell,
            for: indexPath) as? BookMarkCell else { return UITableViewCell() }
        let movie = bookMarksArray[indexPath.row]
        guard let posterString = movie.posterImage else { return UITableViewCell() }
        let url = URL(string: "https://image.tmdb.org/t/p/w300" + posterString)
        cell.movieImage.kf.setImage(with: url)
        cell.movieTitle.text = movie.title
        cell.movieYear.text = viewModal.convertDate(movie.year)
        guard let rate = movie.rate else { return UITableViewCell() }
        cell.movieRate.text = String(rate)
        return cell
    }

}

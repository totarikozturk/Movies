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
    var bookMarksArray: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        bookMarksArray.removeAll()
//        UserDefaults.standard.removeObject(forKey: Code.codableKey)
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTableViewData()
    }

    func updateTableViewData() {
            self.load()
//        let data = BookMarksViewModal.shared.bookMarksData
//            bookMarksArray.append(data)
//            save()
//            tableView.reloadData()
//            print(bookMarksArray.count)
    }

    func addBookmark() {
        let data = BookMarksViewModal.shared.bookMarksData
                bookMarksArray.append(data)
                save()
            tableView.reloadData()
        print(bookMarksArray.count)
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

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

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

}

extension BookMarksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookMarkCell.BookmarkCell,
            for: indexPath) as? BookMarkCell else { return UITableViewCell() }
        cell.movieImage.image = UIImage(systemName: "display")
        cell.movieTitle.text =  "Title"
        return cell
    }

}

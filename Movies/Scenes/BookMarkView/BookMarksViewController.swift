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

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: below line code writed for when need to clear bookmark data
//        UserDefaults.standard.removeObject(forKey: Code.codableKey)
        configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTableViewData()
    }

    func updateTableViewData() {
        viewModal.addBookmark()
        BookMarksViewModal.shared.favButtonTapped = false
        viewModal.load()
        tableView.reloadData()
    }

}

extension BookMarksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModal.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookMarkCell.BookmarkCell,
            for: indexPath) as? BookMarkCell else { return UITableViewCell() }

        let movie = viewModal.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }

}

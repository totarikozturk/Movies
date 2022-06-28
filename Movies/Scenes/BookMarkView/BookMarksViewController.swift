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
//        updateTableViewData()
        configureView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        updateTableViewData()
    }
//
//     func save() {
//        let movie = BookMarksViewModal.shared.bookMarksData
//        let data = Movie(title: movie.title,
//                         year: movie.year,
//                         rate: movie.rate,
//                         posterImage: movie.posterImage,
//                         overview: movie.overview)
//         viewModal.bookMarks.append(data)
//         guard let data = try? JSONEncoder().encode(viewModal.bookMarks) else { return }
//        UserDefaults.standard.set(data, forKey: Code.codableKey)
//         updateTableViewData()
//    }
//
//    func updateTableViewData() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        load()
//    }
//
//    func load() {
//        guard let loadedData = UserDefaults.standard.data(forKey: Code.codableKey)  else { return }
//        do {
//            viewModal.bookMarks = try JSONDecoder().decode([Movie].self, from: loadedData)
//            tableView.reloadData()
//        } catch { print(error) }
//    }
//
}

extension BookMarksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModal.bookMarks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookMarkCell.BookmarkCell,
            for: indexPath) as? BookMarkCell else { return UITableViewCell() }
        let movie = viewModal.bookMarks[indexPath.row]

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

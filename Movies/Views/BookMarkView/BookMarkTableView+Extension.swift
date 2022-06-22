//
//  BookMarkTableView+Extension.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

extension BookMarksViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
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

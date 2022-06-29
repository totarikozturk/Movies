//
//  BookMarksViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import Foundation

struct BookMarksViewModal {
    static var shared = BookMarksViewModal()
    var bookMarksData = Movie()

    mutating func getBookMarksData(movie: Movie) {
        BookMarksViewModal.shared.bookMarksData = movie
    }

    func convertDate(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }

}

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
    var favButtonTapped: Bool = false
    private var bookMarksArray: [Movie] = []

    mutating func getBookMarksData(movie: Movie) {
        BookMarksViewModal.shared.bookMarksData = movie
    }

    mutating func addBookmark() {
        let data = BookMarksViewModal.shared.bookMarksData
            if BookMarksViewModal.shared.favButtonTapped {
                self.bookMarksArray.append(data)
                save()
                BookMarksViewModal.shared.favButtonTapped = false
        }
    }

    func save() {
        guard let data = try? JSONEncoder().encode(bookMarksArray) else { return }
        UserDefaults.standard.set(data, forKey: Code.codableKey)
    }

    mutating func load() {
        guard let loadedData = UserDefaults.standard.data(forKey: Code.codableKey)  else { return }
        do {
            bookMarksArray = try JSONDecoder().decode([Movie].self, from: loadedData)
        } catch { print(error) }
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

    func numberOfRowsInSection(section: Int) -> Int {
        if bookMarksArray.count != 0 {
            return bookMarksArray.count
        }
        return 0
    }

    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return bookMarksArray[indexPath.row]
    }

}

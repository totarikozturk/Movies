//
//  BookMarksViewModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import Foundation

struct BookMarksViewModal {

    private var bookMarksArray: [Movie] = []

    mutating func getBookMarksData(movie: Movie) {
        Singleton.movieBookmarkData = movie
    }

    mutating func addBookmark() {
        let data =  Singleton.movieBookmarkData
        if  Singleton.favButtonTapped {
            if self.bookMarksArray.isEmpty {
                self.bookMarksArray.append(data)
                save()
            } else {
                if self.bookMarksArray.contains(where: {$0.title == data.title}) {
                    Singleton.favButtonTapped = false
                } else {
                   self.bookMarksArray.append(data)
                    save()
                    Singleton.favButtonTapped = false
                }
            }
            Singleton.favButtonTapped = false
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

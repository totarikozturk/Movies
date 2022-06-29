//
//  Extensions.swift
//  ToDoList
//
//  Created by TarıkOzturk on 5.06.2022.
//
import Foundation

extension BookMarksViewController {

    func save() {
        guard let data = try? JSONEncoder().encode(bookMarksArray) else { return }
        UserDefaults.standard.set(data, forKey: Code.codableKey)
    }

    func load() {
        guard let loadedData = UserDefaults.standard.data(forKey: Code.codableKey)  else { return }
        do {
            bookMarksArray = try JSONDecoder().decode([Movie].self, from: loadedData)
            tableView.reloadData()
        } catch { print(error) }
    }

}

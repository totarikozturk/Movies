//
//  MakeBookMarkView.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

extension BookMarksViewController {

    func configureView() {
        drawDesign()
        makeTableView()
        navigationBarAppearance()
    }

    func drawDesign() {
        view.backgroundColor = .blue
        view.addSubview(tableView)
    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookMarkCell.self, forCellReuseIdentifier: BookMarkCell.BookmarkCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.title = "BookMarks"
    }

}

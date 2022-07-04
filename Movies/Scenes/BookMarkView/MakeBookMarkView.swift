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
        view.addSubview(tableView)
    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 180
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BookMarkCell.self, forCellReuseIdentifier: BookMarkCell.BookmarkCell)
        tableView.separatorStyle = .none
        tableView.backgroundColor = CustomColor.backGroundColor
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes  = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationItem.title = Titles.bookmarkViewTitle
    }

}

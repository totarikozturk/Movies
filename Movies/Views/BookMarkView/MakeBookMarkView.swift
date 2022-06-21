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
        NavigationBarAppearance()
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
        tableView.register(BookMarkCell.self,forCellReuseIdentifier: Cells.BookmarkCell)
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(116)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
        }
    }
    
    func NavigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.title = "BookMarks"
    }
    
}

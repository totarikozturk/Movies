//
//  MakeMovieDetailView.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

extension MovieDetailViewController {
    
    func configureView() {
        drawDesign()
        makeDetailImageView()
        makeDetailTitleView()
        makeDetailDescview()
        NavigationBarAppearance()
    }
    
    func drawDesign() {
        view.addSubview(detailImage)
        view.addSubview(detailTitle)
        view.addSubview(detailDesc)
        view.backgroundColor = .orange
    }
    
    func makeDetailImageView() {
        
    }
    
    func makeDetailTitleView() {
        
    }
    
    func makeDetailDescview() {
        
    }
    
    func NavigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.title = "MovieDetail"
    }
    
}

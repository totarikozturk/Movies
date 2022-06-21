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
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.centerY)
        }
    }
    
    func makeDetailTitleView() {
        detailTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp_bottomMargin).offset(8)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(60)
        }
    }
    
    func makeDetailDescview() {
        detailDesc.lineBreakMode = .byWordWrapping
        detailDesc.numberOfLines = 0
        detailDesc.textAlignment = .left
        detailDesc.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp_bottomMargin).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
        }
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

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
        makeDetailYearTitleView()
        makeDetailYearView()
        makeDetailRateTitleView()
        makeDetailRateView()
        makeDetailDescview()
        navigationBarAppearance()
    }

    func drawDesign() {
        view.addSubview(detailImage)
        view.addSubview(detailTitle)
        view.addSubview(detailYearTitle)
        view.addSubview(detailYear)
        view.addSubview(detailRateTitle)
        view.addSubview(detailRate)
        view.addSubview(detailDesc)
        view.backgroundColor = .orange
    }

    func makeDetailImageView() {
        detailImage.layer.cornerRadius = 16
        detailImage.clipsToBounds = true
        detailImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.centerY)
        }
    }

    func makeDetailTitleView() {
        detailTitle.lineBreakMode = .byWordWrapping
        detailTitle.numberOfLines = 0
        detailTitle.textAlignment = .center
        detailTitle.adjustsFontSizeToFitWidth = true
        detailTitle.textColor = UIColor.black
        detailTitle.font = .boldSystemFont(ofSize: 24)
        detailTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }

    func makeDetailYearTitleView() {
        detailYearTitle.textColor = UIColor.black
        detailYearTitle.font = .boldSystemFont(ofSize: 16)
        detailYearTitle.text = "Release Date:"
        detailYearTitle.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
        }
    }

    func  makeDetailYearView() {
        detailYear.textColor = UIColor.black
        detailYear.font = .systemFont(ofSize: 16)
        detailYear.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp.bottom).offset(8)
            make.left.equalTo(detailYearTitle.snp.right).offset(4)
        }
    }

    func makeDetailRateTitleView() {
        detailRateTitle.textColor = UIColor.black
        detailRateTitle.font = .boldSystemFont(ofSize: 16)
        detailRateTitle.text = "Rate: 10/"
        detailRateTitle.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp.bottom).offset(8)
            make.left.equalTo(detailYear.snp.right).offset(16)
        }
    }

    func  makeDetailRateView() {
        detailRate.textColor = UIColor.black
        detailRate.font = .boldSystemFont(ofSize: 16)
        detailRate.snp.makeConstraints { make in
            make.top.equalTo(detailTitle.snp.bottom).offset(8)
            make.left.equalTo(detailRateTitle.snp.right)
        }
    }

    func makeDetailDescview() {
        detailDesc.lineBreakMode = .byWordWrapping
        detailDesc.numberOfLines = 0
        detailDesc.textAlignment = .left
        detailDesc.snp.makeConstraints { make in
            make.top.equalTo(detailRate.snp.bottom).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
        }
    }

    func navigationBarAppearance() {
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationItem.title = "MovieDetail"
    }

}

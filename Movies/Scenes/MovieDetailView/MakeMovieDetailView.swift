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
        makeDetailYearTitleView()
        makeDetailYearView()
        makeDetailRateTitleView()
        makeDetailRateView()
        makeDetailDescview()
        navigationBarAppearance()
    }

    func drawDesign() {
        view.addSubview(detailImage)
        view.addSubview(detailYearTitle)
        view.addSubview(detailYear)
        view.addSubview(detailRateTitle)
        view.addSubview(detailRate)
        view.addSubview(detailDesc)
        view.backgroundColor = CustomColor.contentViewColor
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

    func makeDetailYearTitleView() {
        detailYearTitle.textColor = CustomColor.titleColor
        detailYearTitle.font = .boldSystemFont(ofSize: 16)
        detailYearTitle.text = "Release Date:"
        detailYearTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
        }
    }

    func  makeDetailYearView() {
        detailYear.textColor = CustomColor.textColor
        detailYear.font = .systemFont(ofSize: 16)
        detailYear.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(8)
            make.left.equalTo(detailYearTitle.snp.right).offset(4)
        }
    }

    func makeDetailRateTitleView() {
        detailRateTitle.textColor = CustomColor.titleColor
        detailRateTitle.font = .boldSystemFont(ofSize: 16)
        detailRateTitle.text = "Rate: "
        detailRateTitle.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(8)
            make.left.equalTo(detailYear.snp.right).offset(16)
        }
    }

    func  makeDetailRateView() {
        detailRate.textColor = CustomColor.textColor
        detailRate.font = .boldSystemFont(ofSize: 16)
        detailRate.snp.makeConstraints { make in
            make.top.equalTo(detailImage.snp.bottom).offset(8)
            make.left.equalTo(detailRateTitle.snp.right)
        }
    }

    func makeDetailDescview() {
        detailDesc.lineBreakMode = .byWordWrapping
        detailDesc.numberOfLines = 0
        detailDesc.textAlignment = .left
        detailDesc.textColor = CustomColor.textColor
        detailDesc.snp.makeConstraints { make in
            make.top.equalTo(detailRate.snp.bottom).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
        }
    }

    func navigationBarAppearance() {
        var viewmodal = MovieDetailViewModal()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CustomColor.backGroundColor
        guard let customColor = CustomColor.titleColor else { return }
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
        appearance.titleTextAttributes  = [.foregroundColor: customColor]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = CustomColor.backGroundColor
        navigationItem.title = viewmodal.movieData().title
    }

}

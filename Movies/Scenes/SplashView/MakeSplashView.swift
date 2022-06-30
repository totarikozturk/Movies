//
//  MakeSplashView.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

extension SplashViewController {

    func configureView() {
        view.addSubview(activityIndicator)
        view.addSubview(appTitle)
        makeAppTitle()
        startLoading()
    }

    func makeActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }

    func makeAppTitle() {
        appTitle.text = "Movies"
        appTitle.textColor = .white
        appTitle.font = .systemFont(ofSize: 70, weight: .bold )
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(72)
            make.centerX.equalTo(view.center.x)
        }
    }

    func startLoading() {
        makeActivityIndicator()
        activityIndicator.startAnimating()
    }

    func setTabBarController() {
        let tabbarViewController = UITabBarController()
        let viewController1 = UINavigationController(rootViewController: MoviesViewController())
        let viewController2 = UINavigationController(rootViewController: BookMarksViewController())
        viewController1.title = "Movie"
        viewController2.title = "BookMarks"
        tabbarViewController.tabBar.backgroundColor = .lightGray
        tabbarViewController.setViewControllers([viewController1, viewController2], animated: false)

        guard let items = tabbarViewController.tabBar.items else { return }

        let images = ["display", "book"]

        for item in 0..<items.count {
            items[item].image = UIImage(systemName: images[item])
        }

        tabbarViewController.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(tabbarViewController, animated: true)
        }
    }

}

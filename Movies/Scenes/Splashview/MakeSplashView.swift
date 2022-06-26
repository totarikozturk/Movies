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
        startLoading()
    }

    func makeActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
    }

    func startLoading() {
        makeActivityIndicator()
        activityIndicator.startAnimating()
        loadedData.fetchPopularMoviesData {
            self.apiService.getPopularMoviesData { [weak self] (result) in
                switch result {
                case .success(let data):
                    print("\(data) succes")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                        self?.setTabBarController()
                        self?.activityIndicator.stopAnimating()
                    }
                case.failure(let error):
                    print("Error processing json data: \(error)")
                }
            }
        }
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

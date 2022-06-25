//
//  ProgressViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
// Launch screen interface file base name changed with SplashViewController

import UIKit

class SplashViewController: UIViewController {

    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        startLoading()
        apiService.getPopularMoviesData { (result) in
            print(result)
            self.stopLoading()
            self.setTabBarController()
        }
    }

}

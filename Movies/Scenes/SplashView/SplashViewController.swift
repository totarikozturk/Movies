//
//  ProgressViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
// Launch screen interface file base name changed with SplashViewController

import UIKit

class SplashViewController: UIViewController {

    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let appTitle = UILabel()
    let apiService = ApiService()
    let loadedData = MoviesViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        configureView()
    }

}

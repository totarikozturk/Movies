//
//  ProgressViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
// Launch screen interface file base name changed with SplashViewController

import UIKit

class SplashViewController: UIViewController {

    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        startLoading()
    }

}

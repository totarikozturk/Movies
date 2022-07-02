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
    private let viewModal = SplashViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        waitLoad()
    }

    func waitLoad() {
        viewModal.fetchMoviesData { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                self?.setTabBarController()
                self?.activityIndicator.stopAnimating()
            }
        }
    }

}

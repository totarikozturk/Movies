//
//  ProgressViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
// Launch screen interface file base name changed with SplashViewController

import UIKit

class SplashViewController: UIViewController {
    
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        startLoading()
    }
    
    private  func startLoading(){
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.style = UIActivityIndicatorView.Style.large
        view.addSubview(activityIndicator);
        activityIndicator.startAnimating()
        
//        DispatchQueue will change after API avilable 
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            stopLoading()
            let vC = MoviesViewController()
            self.view.window?.rootViewController = vC
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    private func stopLoading(){
        activityIndicator.stopAnimating();
    }
    
}

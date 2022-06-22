//
//  MakeSplashView.swift
//  Movies
//
//  Created by TarıkOzturk on 21.06.2022.
//

import UIKit

extension SplashViewController {
    
    func startLoading() {
        activityIndicator.center = self.view.center;
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.style = UIActivityIndicatorView.Style.large
        view.addSubview(activityIndicator);
        activityIndicator.startAnimating()
        
        //        DispatchQueue will change after API avilable
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            setViewController()
            stopLoading()
        }
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating();
    }
    
    func setViewController() {
        let tabbarViewController = UITabBarController()
        let viewController1 = UINavigationController(rootViewController: MoviesViewController())
        let viewController2 = UINavigationController(rootViewController:  BookMarksViewController())
        viewController1.title = "Moview"
        viewController2.title = "BookMarks"
        tabbarViewController.tabBar.backgroundColor = .lightGray
        tabbarViewController.setViewControllers([viewController1, viewController2], animated: false)
        
        guard let items = tabbarViewController.tabBar.items else { return }
        
        let images = ["display", "book"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabbarViewController.modalPresentationStyle = .fullScreen
        present(tabbarViewController, animated: true)
    }
    
}

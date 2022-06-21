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
        let tabbarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: MoviesViewController())
        let vc2 = UINavigationController(rootViewController:  BookMarksViewController())
        
        vc1.title = "Moview"
        vc2.title = "BookMarks"
        
        tabbarVC.tabBar.backgroundColor = .lightGray
        tabbarVC.setViewControllers([vc1, vc2], animated: false)
        
        guard let items = tabbarVC.tabBar.items else { return }
        
        let images = ["display", "book"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabbarVC.modalPresentationStyle = .fullScreen
        present(tabbarVC, animated: true)
    }
    
}

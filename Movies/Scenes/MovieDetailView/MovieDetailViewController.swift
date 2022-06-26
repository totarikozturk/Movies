//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by TarıkOzturk on 19.06.2022.
//

import UIKit

class MovieDetailViewController: UIViewController {

    let appearance = UINavigationBarAppearance()
    let detailImage = UIImageView()
    let detailTitle = UILabel()
    let detailDesc = UILabel()
    let viewModal = MovieDetailViewModal()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        getData()
    }

    func getData() {

    }

}

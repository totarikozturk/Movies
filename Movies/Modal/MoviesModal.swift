//
//  MoviesModal.swift
//  Movies
//
//  Created by TarıkOzturk on 22.06.2022.
//

import UIKit

struct MoviesModal: Codable {

    var movieTitle: String
    var movieImage: Image
    var movieDesc: String

    struct Image: Codable {
        let imageData: Data?

        init(withImage image: UIImage) {
            self.imageData = image.pngData()
        }

        func getImage() -> UIImage? {
            guard let imageData = self.imageData else {
                return nil
            }
            let image = UIImage(data: imageData)

            return image
        }
    }

}

//
//  Photo.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit

struct Photo {
    let image: UIImage
    let isLiked: Bool
}

extension Photo {
    static let photos: [Photo] = [
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
        Photo(image: UIImage(systemName: "questionmark.circle.fill")!, isLiked: false),
    ]
}

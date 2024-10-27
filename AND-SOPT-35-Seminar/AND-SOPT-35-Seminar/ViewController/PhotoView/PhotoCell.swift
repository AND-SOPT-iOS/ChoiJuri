//
//  PhotoCell.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit
import SnapKit
import Then

class PhotoCell: UICollectionViewCell {
    static let identifier: String = "PhotoCell"
    
    private let photoImageView = UIImageView()
    private let likeButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            photoImageView,
            likeButton
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
    
    func configuration(photo: Photo) {
        photoImageView.image = photo.image
        likeButton.setImage(
            photo.isLiked ? UIImage(systemName: "haert.fill") : UIImage(systemName: "heart"), for: .normal
        )
    }
}

//
//  PreviewView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class PreviewView: BaseView {
    
    private var previewStackView = UIStackView()
    private var previewLabel = UILabel()
    private var previewImageView = UIImageView()
    private var previewBottomStackView = UIStackView()
    private var phoneImageView = UIImageView()
    private var phoneLabel = UILabel()
    private var divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        previewStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 5
        }
        previewLabel.do {
            $0.text = "미리보기"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        previewImageView.do {
            $0.image = .preview
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 50
            $0.layer.masksToBounds = true
            $0.clipsToBounds = true
        }
        previewBottomStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
        phoneImageView.do {
            $0.image = UIImage(systemName: "iphone.rear.camera")
            $0.tintColor = .systemGray
        }
        phoneLabel.do {
            $0.text = "iPhone"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14, weight: .bold)
        }
    }
    
    override func addViews() {
        self.addSubview(previewStackView)
        previewStackView.addArrangedSubViews(previewLabel, previewImageView, previewBottomStackView)
        previewBottomStackView.addArrangedSubViews(phoneImageView, phoneLabel)
    }
    
    override func setLayout() {
        previewStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        previewImageView.snp.makeConstraints {
            $0.height.equalTo(650)
        }
    }
}

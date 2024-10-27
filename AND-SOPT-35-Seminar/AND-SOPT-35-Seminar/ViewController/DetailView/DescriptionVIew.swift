//
//  DescriptionVIew.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class DescriptionVIew: BaseView {
    
    private let descriptionStackView = UIStackView()
    private let descriptionLabel = UILabel()
    
    private let developerStackView = UIStackView()
    private let developerLabelStackView = UIStackView()
    private let developerLabel = UILabel()
    private let developerSubLabel = UILabel()
    private let developerMoreButton = UIButton()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        descriptionStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        descriptionLabel.do {
            $0.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
            $0.numberOfLines = 0
        }
        developerStackView.do {
            $0.axis = .horizontal
        }
        developerLabelStackView.do {
            $0.axis = .vertical
        }
        developerLabel.do {
            $0.text = "Viva Republica"
            $0.textColor = .systemBlue
        }
        developerSubLabel.do {
            $0.text = "개발자"
            $0.textColor = .systemGray
        }
        developerMoreButton.do {
            $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            $0.tintColor = .systemGray
        }
        
    }
    override func addViews() {
        addSubview(descriptionStackView)
        descriptionStackView.addArrangedSubViews(descriptionLabel, developerStackView)
        developerStackView.addArrangedSubViews(developerLabelStackView, UIView(), developerMoreButton)
        developerLabelStackView.addArrangedSubViews(developerLabel, developerSubLabel)
    }
    override func setLayout() {
        descriptionStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
}

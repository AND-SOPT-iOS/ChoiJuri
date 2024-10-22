//
//  DescriptionVIew.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class DescriptionVIew: BaseView {
    
    private var descriptionStackView = UIStackView()
    private var descriptionLabel = UILabel()
    
    private var developerStackView = UIStackView()
    private var developerLabelStackView = UIStackView()
    private var developerLabel = UILabel()
    private var developerSubLabel = UILabel()
    private var developerMoreButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        self.addSubview(descriptionStackView)
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

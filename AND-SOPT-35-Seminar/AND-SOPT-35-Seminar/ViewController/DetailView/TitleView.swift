//
//  TitleViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class TitleView: BaseView {
    
    private let titleStackView = UIStackView()
    private let thumbnailImageView = UIImageView()
    private let titleLabelStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let titleButtonStackView = UIStackView()
    private let openButton = UIButton()
    private let shareButton = UIButton()
    
    private var buttonConfig = UIButton.Configuration.filled()

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        buttonConfig.cornerStyle = .capsule
        
        titleStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
        thumbnailImageView.do {
            $0.image = .thumbnail
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabelStackView.do {
            $0.axis = .vertical
        }
        titleLabel.do {
            $0.text = "토스"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        subtitleLabel.do {
            $0.text = "금융이 쉬워진다"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 16)
        }
        titleButtonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
        openButton.do {
            $0.setTitle("열기", for: .normal)
            $0.configuration = buttonConfig
        }
        shareButton.do {
            let image = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
            $0.setImage(UIImage(systemName: "square.and.arrow.up", withConfiguration: image), for: .normal)
        }
    }
    
    override func addViews() {
        addSubviews(titleStackView)
        titleStackView.addArrangedSubViews(thumbnailImageView, titleLabelStackView)
        titleLabelStackView.addArrangedSubViews(titleLabel, subtitleLabel, UIView(), titleButtonStackView)
        titleButtonStackView.addArrangedSubViews(openButton, UIView(), UIView(), shareButton)
    }
    
    override func setLayout() {
        titleStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        thumbnailImageView.snp.makeConstraints {
            $0.width.height.equalTo(120)
        }
    }
}

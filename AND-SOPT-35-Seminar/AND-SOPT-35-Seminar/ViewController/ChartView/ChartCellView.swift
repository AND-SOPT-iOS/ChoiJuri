//
//  ChartCellView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/29/24.
//

import UIKit

class ChartCellView: BaseView {
    
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    
    private var buttonConfig = UIButton.Configuration.gray()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        buttonConfig.cornerStyle = .capsule
        titleLabel.do {
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 18)
        }
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        subTitleLabel.do {
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .systemGray
        }
        downloadButton.do {
            $0.configuration = buttonConfig
            $0.setTitle("받기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
    }
    
    override func addViews() {
        addSubviews(iconImageView, verticalStackView, downloadButton)
        verticalStackView.addArrangedSubViews(titleLabel, subTitleLabel)
    }
    
    override func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(40)
        }
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(15)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.centerY.equalToSuperview()
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(70)
            $0.height.equalTo(35)
        }
    }
    
    func configure(app: App) {
        iconImageView.image = app.iconImage
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        //      downloadButton.setTitle(app.downloadState.title, for: .normal)
    }
}
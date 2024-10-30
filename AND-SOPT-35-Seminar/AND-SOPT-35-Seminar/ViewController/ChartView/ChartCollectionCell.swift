//
//  ChartCollectionCell.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/29/24.
//

import UIKit

final class ChartCollectionCell: UICollectionViewCell {
    
    static let identifier = "ChartCollectionCell"
    
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    private var buttonConfig = UIButton.Configuration.gray()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initAttributes()
        addViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initAttributes() {
        
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
        rankingLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .bold)
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
    
    private func addViews() {
        
        addSubviews(iconImageView,
                    rankingLabel,
                    verticalStackView,
                    downloadButton)
        verticalStackView.addArrangedSubViews(titleLabel,
                                              subTitleLabel)
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(12)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(15)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(85)
            $0.height.equalTo(35)
        }
    }
    
    func configuration(app: App) {
        iconImageView.image = app.iconImage
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        if app.downloadState == .redownload {
            downloadButton.setTitle("", for: .normal)
            downloadButton.setImage(UIImage(systemName: "icloud.and.arrow.down"), for: .normal)
        } else {
            downloadButton.setTitle(app.downloadState.rawValue, for: .normal)
        }
    }
}

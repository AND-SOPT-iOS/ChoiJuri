//
//  ChartCell.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit
import SnapKit
import Then

class ChartCell: UITableViewCell {
    
    static let identifier: String = "ChartCell"
    
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    private var buttonConfig = UIButton.Configuration.gray()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?) {
            
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
            $0.font = .systemFont(ofSize: 20, weight: .bold)
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
            $0.leading.equalToSuperview().offset(10)
            $0.size.equalTo(50)
        }
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(18)
        }
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(15)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(18)
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
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        //      downloadButton.setTitle(app.downloadState.title, for: .normal)
    }
}


//
//  FirstSectionView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/28/24.
//

import UIKit

final class FirstSectionViewCell: UICollectionViewCell {
    
    static let identifier = "FirstSectionViewCell"
    
    private let contentStackView = UIStackView()
    private let firstLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let cardView = UIView()
    private let appImageView = UIImageView()
    private let chartCellView = ChartCellView()
    
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
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 4
        }
        firstLabel.do {
            $0.text = "추천"
            $0.textColor = .systemBlue
            $0.font = .systemFont(ofSize: 12)
        }
        titleLabel.do {
            $0.text = "Taxnote 부기 및 회계 앱"
            $0.font = .systemFont(ofSize: 24)
        }
        subtitleLabel.do {
            $0.text = "간편한 장부 관리"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 22)
        }
        appImageView.do {
            let image: UIImage = .thumbnail
            $0.image = image
            $0.contentMode = .scaleAspectFit
        }
        chartCellView.do {
            $0.configure(app: App.mockData[0])
        }
    }
    
    private func addViews() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubViews(firstLabel, titleLabel, subtitleLabel, cardView)
        cardView.addSubviews(appImageView, chartCellView)
    }
    
    private func setLayout() {
        contentStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        cardView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        appImageView.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.width.equalToSuperview()
        }
        chartCellView.snp.makeConstraints {
            $0.width.equalTo(appImageView.snp.width)
            $0.bottom.equalTo(appImageView.snp.bottom).inset(50)
        }
    }
}

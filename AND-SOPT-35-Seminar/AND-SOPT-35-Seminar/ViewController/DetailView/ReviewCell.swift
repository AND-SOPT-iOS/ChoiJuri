//
//  ReviewCell.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/30/24.
//

import UIKit

final class ReviewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    private let reviewContentStackView = UIStackView()
    private let reviewContentTitleStackView = UIStackView()
    private let reviewContentTitleLabel = UILabel()
    private let reviewContentDateLabel = UILabel()
    private let reviewContentStarStackView = UIStackView()
    private let reviewContentStarLabel = UILabel()
    private let reviewWriterLabel = UILabel()
    private let reviewContentLabel = UILabel()
    
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
        reviewContentStackView.do {
            $0.axis = .vertical
            $0.backgroundColor = .systemGray5
            $0.spacing = 5
            $0.layer.cornerRadius = 5
            $0.layer.masksToBounds = true
            $0.clipsToBounds = true
        }
        reviewContentTitleStackView.do {
            $0.axis = .horizontal
        }
        reviewContentStarStackView.do {
            $0.axis = .horizontal
        }
        reviewContentTitleLabel.do {
            $0.text = "최주리"
            $0.font = .systemFont(ofSize: 18, weight: .bold)
        }
        reviewContentDateLabel.do {
            $0.text = "10월 17일  "
            $0.textColor = .systemGray
        }
        reviewContentStarLabel.do {
            $0.text = "★★★★★"
            $0.textColor = .systemYellow
        }
        reviewWriterLabel.do {
            $0.text = "ISTP"
            $0.textColor = .systemGray
        }
        reviewContentLabel.do {
            $0.text = "\n동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. 무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세.\n"
            $0.numberOfLines = 0
        }
    }
    
    private func addViews() {
        addSubview(reviewContentStackView)
        reviewContentStackView.addArrangedSubViews(
            reviewContentTitleStackView,
            reviewContentStarStackView,
            reviewContentLabel
        )
        reviewContentTitleStackView.addArrangedSubViews(
            reviewContentTitleLabel,
            reviewContentDateLabel
        )
        reviewContentStarStackView.addArrangedSubViews(
            reviewContentStarLabel,
            UIView(),
            reviewWriterLabel
        )
    }
    
    private func setLayout() {
        reviewContentStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        reviewContentTitleStackView.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(10)
        }
        reviewContentStarStackView.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(10)
        }
        reviewContentLabel.snp.makeConstraints {
            $0.right.left.equalToSuperview().inset(10)
        }
    }
    
    func configuration(app: App) {

    }
    
}

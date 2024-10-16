//
//  ReviewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/17/24.
//

import UIKit

class ReviewView: BaseView {
    
    private var reviewStackView = UIStackView()
    private var reviewTitleStackView = UIStackView()
    private var reviewTitleLabel = UILabel()
    private var reviewMoreButton = UIButton()
    private var reviewScoreStackView = UIStackView()
    private var reviewNumLabel = UILabel()
    private var reviewPerfectLabel = UILabel()
    private var starStackView = UIStackView()
    private var starImageView = UIImageView()
    private var allStarLabel = UILabel()
    private var reviewNumStackView = UIStackView()
    
    private var divider = UIView()
    
    private var tapStackView = UIStackView()
    private var tapLabel = UILabel()
    private var tapStarLabel = UILabel()
    
    private var reviewContentStackView = UIStackView()
    private var reviewContentTitleStackView = UIStackView()
    private var reviewContentTitleLabel = UILabel()
    private var reviewContentDateLabel = UILabel()
    private var reviewContentStarStackView = UIStackView()
    private var reviewContentStarLabel = UILabel()
    private var reviewWriterLabel = UILabel()
    private var reviewContentLabel = UILabel()
    
    private var reviewWriteStackView = UIStackView()
    private var reviewWriteButton = UIButton()
    private var backupButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        reviewStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        reviewTitleStackView.do {
            $0.axis = .horizontal
        }
        reviewTitleLabel.do {
            $0.text = "평가 및 리뷰"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        reviewMoreButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
        reviewScoreStackView.do {
            $0.axis = .horizontal
        }
        reviewNumStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
        }
        reviewNumLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 50, weight: .heavy)
            $0.textColor = .systemGray
        }
        reviewPerfectLabel.do {
            $0.text = "5점 만점"
            $0.textColor = .systemGray
        }
        starStackView.do {
            $0.axis = .vertical
            $0.alignment = .trailing
        }
        starImageView.do {
            $0.image = .star
            $0.contentMode = .scaleAspectFit
        }
        allStarLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
        }
        divider.do {
            $0.backgroundColor = .systemGray3
        }
        tapStackView.do {
            $0.axis = .horizontal
        }
        tapLabel.do {
            $0.text = "탭하여 평가하기:"
            $0.textColor = .systemGray2
        }
        tapStarLabel.do {
            $0.text = "☆ ☆ ☆ ☆ ☆"
            $0.textColor = .systemBlue
            $0.font = .systemFont(ofSize: 30)
        }
        
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
        reviewWriteStackView.do {
            $0.axis = .horizontal
        }
        reviewWriteButton.do {
            $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            $0.setTitle(" 리뷰 작성", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
        backupButton.do {
            $0.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
            $0.setTitle(" 앱 지원", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
    }
    override func addViews() {
        self.addSubview(reviewStackView)
        reviewStackView.addArrangedSubViews(reviewTitleStackView, reviewScoreStackView, divider, tapStackView, reviewContentStackView, reviewWriteStackView)
        reviewTitleStackView.addArrangedSubViews(reviewTitleLabel, UIView(), reviewMoreButton)
        reviewScoreStackView.addArrangedSubViews(reviewNumStackView, starStackView)
        reviewNumStackView.addArrangedSubViews(reviewNumLabel, reviewPerfectLabel)
        starStackView.addArrangedSubViews(starImageView, allStarLabel)
        tapStackView.addArrangedSubViews(tapLabel, UIView(), tapStarLabel)
        reviewContentStackView.addArrangedSubViews(reviewContentTitleStackView, reviewContentStarStackView, reviewContentLabel)
        reviewContentTitleStackView.addArrangedSubViews(reviewContentTitleLabel, reviewContentDateLabel)
        reviewContentStarStackView.addArrangedSubViews(reviewContentStarLabel, UIView(), reviewWriterLabel)
        reviewWriteStackView.addArrangedSubViews(reviewWriteButton, UIView(), backupButton)
    }
    override func setLayout() {
        reviewStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        reviewTitleStackView.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        reviewScoreStackView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
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
}

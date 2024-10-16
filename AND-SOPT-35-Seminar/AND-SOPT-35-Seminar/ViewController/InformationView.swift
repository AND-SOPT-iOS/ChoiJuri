//
//  InformationView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class InformationView: BaseView {
    
    private var summaryStackView = UIStackView()
    private var avgStackView = UIStackView()
    private var avgTitleLabel = UILabel()
    private var avgNumLabel = UILabel()
    private var avgStarLabel = UILabel()
    private var prizeStackView = UIStackView()
    private var prizeTitleLabel = UILabel()
    private var prizeImageView = UIImageView()
    private var prizeLabel = UILabel()
    private var ageStackView = UIStackView()
    private var ageTitleLabel = UILabel()
    private var ageNumLabel = UILabel()
    private var ageLabel = UILabel()
    
    private var firstDivider = UIView()
    private var secondDivider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        summaryStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
        
        avgStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .center
        }
        avgTitleLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        avgNumLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .systemGray
        }
        avgStarLabel.do {
            $0.text = "★★★★☆"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        
        prizeStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .center
        }
        prizeTitleLabel.do {
            $0.text = "수상"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        prizeImageView.do {
            $0.image = UIImage(systemName: "person")
            $0.tintColor = .systemGray
        }
        prizeLabel.do {
            $0.text = "앱"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        
        ageStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .center
        }
        ageTitleLabel.do {
            $0.text = "연령"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        ageNumLabel.do {
            $0.text = "4+"
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .systemGray
        }
        ageLabel.do {
            $0.text = "세"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14)
        }
        firstDivider.do {
            $0.backgroundColor = .systemGray3
        }
        secondDivider.do {
            $0.backgroundColor = .systemGray3
        }
    }
    
    override func addViews() {
        self.addSubviews(summaryStackView)
        
        summaryStackView.addArrangedSubViews(avgStackView, firstDivider, prizeStackView, secondDivider, ageStackView)
        avgStackView.addArrangedSubViews(avgTitleLabel, avgNumLabel, avgStarLabel)
        prizeStackView.addArrangedSubViews(prizeTitleLabel, prizeImageView, prizeLabel)
        ageStackView.addArrangedSubViews(ageTitleLabel, ageNumLabel, ageLabel)
    }
    
    override func setLayout() {
        summaryStackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.horizontalEdges.equalToSuperview()
        }
        avgStackView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        prizeStackView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        ageStackView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
        firstDivider.snp.makeConstraints {
            $0.width.equalTo(0.5)
            $0.height.equalToSuperview().inset(15)
            $0.top.equalToSuperview().offset(20)
        }
        secondDivider.snp.makeConstraints {
            $0.width.equalTo(0.5)
            $0.height.equalToSuperview().inset(15)
            $0.top.equalToSuperview().offset(20)
        }
    }
}

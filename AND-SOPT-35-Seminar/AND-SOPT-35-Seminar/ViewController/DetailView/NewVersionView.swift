//
//  NewVersionView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

final class NewVersionView: BaseView {
    
    private let newStackView = UIStackView()
    private let newTitleStackView = UIStackView()
    private let newTitleLabel = UILabel()
    var versionRecordButton = UIButton()
    private let newSubTitleStackView = UIStackView()
    private let newVersionLabel = UILabel()
    private let newDateLabel = UILabel()
    private let newDescriptionLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        newStackView.do {
            $0.axis = .vertical
            $0.spacing = 3
        }
        newTitleStackView.do {
            $0.axis = .horizontal
        }
        newTitleLabel.do {
            $0.text = "새로운 소식"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        versionRecordButton.do {
            $0.setTitle("버전 기록", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            
        }
        newSubTitleStackView.do {
            $0.axis = .horizontal
        }
        newVersionLabel.do {
            $0.text = "버전 5.184.0"
            $0.textColor = .systemGray
        }
        newDateLabel.do {
            $0.text = "5일 전"
            $0.textColor = .systemGray
        }
        newDescriptionLabel.do {
            $0.text = "\n구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
            $0.numberOfLines = 0
        }
    }
    
    override func addViews() {
        addSubview(newStackView)
        newStackView.addArrangedSubViews(newTitleStackView, newSubTitleStackView, newDescriptionLabel)
        newTitleStackView.addArrangedSubViews(newTitleLabel, UIView(), versionRecordButton)
        newSubTitleStackView.addArrangedSubViews(newVersionLabel, UIView(), newDateLabel)
    }
    
    override func setLayout() {
        newStackView.snp.makeConstraints {
            $0.width.equalToSuperview().inset(10)
        }
        newTitleStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        newSubTitleStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
}

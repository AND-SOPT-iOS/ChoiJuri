//
//  ReviewWriteViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/17/24.
//

import UIKit

final class ReviewWriteViewController: BaseViewController {
    private let containerStackView = UIStackView()
    
    private let headerStackView = UIStackView()
    private let cancleButton = UIButton()
    private let titleLabel = UILabel()
    private let sendButton = UIButton()
    
    private let starStackView = UIStackView()
    private let starLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let contentStackView = UIStackView()
    private let titleTextField = UITextField()
    private let contentPlaceHolder = UILabel()
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        containerStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 10
        }
        headerStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
        }
        cancleButton.do {
            $0.setTitle("취소", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        titleLabel.do {
            $0.text = "리뷰 작성하기"
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        sendButton.do {
            $0.setTitle("보내기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        starStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
        }
        starLabel.do {
            $0.text = "☆ ☆ ☆ ☆ ☆"
            $0.textColor = .systemBlue
            $0.font = .systemFont(ofSize: 25)
        }
        descriptionLabel.do {
            $0.text = "별점을 탭하여 평가하기"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 12)
        }
        contentStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 5
        }
        titleTextField.do {
            $0.placeholder = "리뷰(선택사항)"
            $0.borderStyle = .none
            $0.textAlignment = .left
        }
    }
    
    override func addViews() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubViews(headerStackView, starStackView, contentStackView)
        headerStackView.addArrangedSubViews(cancleButton, UIView(), titleLabel, UIView(), sendButton)
        starStackView.addArrangedSubViews(starLabel, descriptionLabel)
        contentStackView.addArrangedSubViews(titleTextField)
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
    
        containerStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).inset(10)
            $0.horizontalEdges.equalTo(safeArea).inset(30)
        }
        headerStackView.snp.makeConstraints {
            $0.width.equalTo(safeArea)
            $0.height.equalTo(40)
        }
        starStackView.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        contentStackView.snp.makeConstraints {
            $0.width.equalTo(safeArea).inset(20)
            $0.height.equalTo(150)
        }
        titleTextField.snp.makeConstraints {
            $0.height.equalTo(20)
        }
    }
    
    @objc
    func buttonTapped() {
        self.dismiss(animated: true)
    }

}

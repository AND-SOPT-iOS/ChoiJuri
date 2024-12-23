//
//  PreviewView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

final class PreviewView: BaseView {
    
    private let previewStackView = UIStackView()
    private let previewLabel = UILabel()
    private let imageScrollView = UIScrollView()
    private let imageStackView = UIStackView()
    private let previewImageView1 = UIImageView()
    private let previewImageView2 = UIImageView()
    private let previewImageView3 = UIImageView()
    private let previewImageView4 = UIImageView()
    private let previewImageView5 = UIImageView()
    private let previewBottomStackView = UIStackView()
    private let phoneImageView = UIImageView()
    private let phoneLabel = UILabel()
    private let divider = DividerView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        previewStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 5
        }
        previewLabel.do {
            $0.text = "미리보기"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        imageScrollView.do {
            $0.showsHorizontalScrollIndicator = false
        }
        imageStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        [previewImageView1, previewImageView2, previewImageView3, previewImageView4, previewImageView5].forEach {
            $0.image = .preview
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 50
//            $0.layer.masksToBounds = true
            $0.clipsToBounds = true
        }
        previewBottomStackView.do {
            $0.axis = .horizontal
            $0.spacing = 15
        }
        phoneImageView.do {
            $0.image = UIImage(systemName: "iphone.rear.camera")
            $0.tintColor = .systemGray
        }
        phoneLabel.do {
            $0.text = "iPhone"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14, weight: .bold)
        }
    }
    
    override func addViews() {
        addSubview(previewStackView)
        previewStackView.addArrangedSubViews(
            previewLabel,
            imageScrollView,
            previewBottomStackView
        )
        previewBottomStackView.addArrangedSubViews(
            phoneImageView,
            phoneLabel
        )
        imageScrollView.addSubview(imageStackView)
        imageStackView.addArrangedSubViews(
            previewImageView1,
            previewImageView2,
            previewImageView3,
            previewImageView4,
            previewImageView5
        )
    }
    
    override func setLayout() {
        previewStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        [previewImageView1, previewImageView2, previewImageView3, previewImageView4, previewImageView5].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(650)
            }
        }
        imageScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        imageStackView.snp.makeConstraints {
            $0.edges.equalTo(imageScrollView)
            $0.height.equalTo(imageScrollView)
            $0.leading.trailing.greaterThanOrEqualToSuperview().priority(.low)
        }
    }
}

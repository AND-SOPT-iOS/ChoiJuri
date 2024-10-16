//
//  PreviewView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

class PreviewView: BaseView {
    
    private var previewStackView = UIStackView()
    private var previewLabel = UILabel()
    private var previewImageView = UIImageView()
    private var previewBottomStackView = UIStackView()
    private var phoneImageView = UIImageView()
    private var phoneLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        previewStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        previewLabel.do {
            $0.text = "미리보기"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        previewImageView.do {
            $0.image = .preview
            $0.contentMode = .scaleAspectFit
        }
    }
    
    override func addViews() {
        self.addSubview(previewStackView)
        previewStackView.addArrangedSubViews(previewLabel, previewImageView)
    }
    
    override func setLayout() {
        previewStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
}

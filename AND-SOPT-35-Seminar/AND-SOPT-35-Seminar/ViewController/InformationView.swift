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
        }
        
    }
    
    override func addViews() {
        
    }
    
    override func setLayout() {
        
    }
    
    
}

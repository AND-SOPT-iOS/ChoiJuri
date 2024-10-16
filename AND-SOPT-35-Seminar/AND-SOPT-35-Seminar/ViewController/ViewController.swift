//
//  ViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/5/24.
//

import UIKit

class ViewController: BaseViewController {
    
    //MARK: - Components
    
    private var scrollView = UIScrollView()
    private var contentStackView = UIStackView()
    
    private var titleView = TitleView()
    private var firstDivider = UIView()
    private var informationView = InformationView()
    private var secondDivider = UIView()
    private var newVersionView = NewVersionView()
    private var thirdDivider = UIView()
    private var previewView = PreviewView()
    
    
    
    private var descriptionStackView = UIStackView()
    private var descriptionLabel = UILabel()
    
    private var developerStackView = UIStackView()
    private var developerLabel = UILabel()
    private var developerMoreButton = UIButton()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        initAttributes()
        addViews()
        setLayout()
    }
    
    override func initAttributes() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        contentStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
        }
        firstDivider.do {
            $0.backgroundColor = .systemGray3
        }
        secondDivider.do {
            $0.backgroundColor = .systemGray3
        }
        thirdDivider.do {
            $0.backgroundColor = .systemGray3
        }
    }
    
    override func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubviews(contentStackView)
        contentStackView.addArrangedSubViews(titleView, firstDivider, informationView, secondDivider, newVersionView, thirdDivider, previewView)
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeArea).inset(20)
            $0.bottom.equalTo(safeArea).offset(10)
        }
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(scrollView)
        }
        titleView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(130)
            $0.left.right.equalTo(contentStackView)
        }
        firstDivider.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        informationView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(90)
        }
        secondDivider.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        newVersionView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(160)
        }
        thirdDivider.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        previewView.snp.makeConstraints {
            $0.height.equalTo(300)
        }
    }
}

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
    
    private var divider = UIView()
    
    
    
    private var newStackView = UIStackView()
    private var newTitleStackView = UIStackView()
    private var newTitleLabel = UILabel()
    private var versionButton = UIButton()
    private var newSubTitleStackView = UIStackView()
    private var newVersionLabel = UILabel()
    private var newDateLabel = UILabel()
    private var newDescriptionLabel = UILabel()
    
    private var previewStackView = UIStackView()
    private var previewLabel = UILabel()
    private var previewImageView = UIImageView()
    private var previewBottomStackView = UIStackView()
    private var phoneImageView = UIImageView()
    private var phoneLabel = UILabel()
    
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
            $0.spacing = 10
        }
        divider.do {
            $0.backgroundColor = .systemGray
        }
    }
    
    override func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubviews(contentStackView)
        contentStackView.addArrangedSubViews(titleView, divider)
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(safeArea).inset(20)
            $0.height.equalTo(1000)
        }
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        titleView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(contentStackView)
            $0.left.right.equalTo(contentStackView)
        }
//        divider.snp.makeConstraints {
//            $0.height.equalTo(1)
//            $0.top.equalTo(titleView.snp.bottom)
//        }
    }
}

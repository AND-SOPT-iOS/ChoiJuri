//
//  ViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Components
    
    private var scrollView = UIScrollView()
    private var contentStackView = UIStackView()
    
    private var titleStackView = UIStackView()
    
    private var thumbnailImageView = UIImageView()
    
    private var titleLabelStackView = UIStackView()
    private var titleLabel = UILabel()
    private var subtitleLabel = UILabel()
    private var titleButtonStackView = UIStackView()
    private var openButton = UIButton()
    private var shareButton = UIButton()
    
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
    }
    
    private func initAttributes() {
        
    }
    
    private func addViews() {
        
    }
}

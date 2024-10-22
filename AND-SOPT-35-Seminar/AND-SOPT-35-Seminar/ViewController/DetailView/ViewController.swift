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
    private var fourthDivider = UIView()
    private var descriptionView = DescriptionVIew()
    private var fifthDivider = UIView()
    private var reviewView = ReviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTarget()
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
        fourthDivider.do {
            $0.backgroundColor = .systemGray3
        }
        fifthDivider.do {
            $0.backgroundColor = .systemGray3
        }
    }
    
    override func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(titleView, firstDivider, informationView, secondDivider, newVersionView, thirdDivider, previewView, fourthDivider, descriptionView, fifthDivider, reviewView)
    }
    
    override func setLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeArea).inset(20)
            $0.bottom.equalTo(safeArea).offset(3)
        }
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
//            $0.height.equalTo(10000)
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
            $0.height.equalTo(720)
        }
        fourthDivider.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        descriptionView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        fifthDivider.snp.makeConstraints {
            $0.height.equalTo(0.5)
        }
        reviewView.snp.makeConstraints {
            $0.height.equalTo(500)
        }
    }
    
    @objc
    func navigateToVersion() {
        let vc = VersionRecordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func navigateToReview() {
        let vc = ReviewListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func presentReviewWriteView() {
        let vc = ReviewWriteViewController()
        self.present(vc, animated: true)
    }
    
    func setAddTarget() {
        newVersionView.versionRecordButton.addTarget(self, action: #selector(navigateToVersion), for: .touchUpInside)
        reviewView.reviewMoreButton.addTarget(self, action: #selector(navigateToReview), for: .touchUpInside)
        reviewView.reviewWriteButton.addTarget(self, action: #selector(presentReviewWriteView), for: .touchUpInside)
    }
}

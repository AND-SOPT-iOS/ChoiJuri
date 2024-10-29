//
//  ViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/5/24.
//

import UIKit

final class DetailViewController: BaseViewController {
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    
    private let titleView = TitleView()
    private let firstDivider = DividerView()
    private let informationView = InformationView()
    private let secondDivider = DividerView()
    private let newVersionView = NewVersionView()
    private let thirdDivider = DividerView()
    private let previewView = PreviewView()
    private let fourthDivider = DividerView()
    private let descriptionView = DescriptionVIew()
    private let fifthDivider = DividerView()
    private let reviewView = ReviewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        contentStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
        }
        newVersionView.do {
            $0.delegate = self
        }
        reviewView.do {
            $0.delegate = self
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
            $0.top.equalTo(safeArea)
            $0.leading.trailing.equalTo(safeArea).inset(20)
            $0.bottom.equalTo(safeArea).offset(3)
        }
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
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
}

extension DetailViewController: NewVersionDelegate {
    func navigateToVersion() {
        let nextViewController = VersionRecordViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension DetailViewController: ReviewDelegate {

    func navigateToReview() {
        let nextViewController = ReviewListViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func presentReviewWriteView() {
        let nextViewController = ReviewWriteViewController()
        self.present(nextViewController, animated: true)
    }
    
}

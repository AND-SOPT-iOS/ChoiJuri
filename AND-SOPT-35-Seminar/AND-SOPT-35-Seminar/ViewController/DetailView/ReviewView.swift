//
//  ReviewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/17/24.
//

import UIKit

final class ReviewView: BaseView {
    
    private let reviewStackView = UIStackView()
    private let reviewTitleStackView = UIStackView()
    private let reviewTitleLabel = UILabel()
    private let reviewMoreButton = UIButton()
    private let reviewScoreStackView = UIStackView()
    private let reviewNumLabel = UILabel()
    private let reviewPerfectLabel = UILabel()
    private let starStackView = UIStackView()
    private let starImageView = UIImageView()
    private let allStarLabel = UILabel()
    private let reviewNumStackView = UIStackView()
    
    private let divider = DividerView()
    
    private let tapStackView = UIStackView()
    private let tapLabel = UILabel()
    private let tapStarLabel = UILabel()
    
    private let reviewCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let reviewWriteStackView = UIStackView()
    var reviewWriteButton = UIButton()
    private let backupButton = UIButton()
    
    weak var delegate: ReviewDelegate?
    
    init() {
        super.init(frame: .zero)
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        reviewStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
        }
        reviewTitleStackView.do {
            $0.axis = .horizontal
        }
        reviewTitleLabel.do {
            $0.text = "평가 및 리뷰"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        reviewMoreButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(navigateToReview), for: .touchUpInside)
        }
        reviewScoreStackView.do {
            $0.axis = .horizontal
        }
        reviewNumStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
        }
        reviewNumLabel.do {
            $0.text = "4.4"
            $0.font = .systemFont(ofSize: 50, weight: .heavy)
            $0.textColor = .systemGray
        }
        reviewPerfectLabel.do {
            $0.text = "5점 만점"
            $0.textColor = .systemGray
        }
        starStackView.do {
            $0.axis = .vertical
            $0.alignment = .trailing
        }
        starImageView.do {
            $0.image = .star
            $0.contentMode = .scaleAspectFit
        }
        allStarLabel.do {
            $0.text = "8.4만개의 평가"
            $0.textColor = .systemGray
        }
        tapStackView.do {
            $0.axis = .horizontal
        }
        tapLabel.do {
            $0.text = "탭하여 평가하기:"
            $0.textColor = .systemGray2
        }
        tapStarLabel.do {
            $0.text = "☆ ☆ ☆ ☆ ☆"
            $0.textColor = .systemBlue
            $0.font = .systemFont(ofSize: 30)
        }
        
        reviewWriteStackView.do {
            $0.axis = .horizontal
        }
        reviewWriteButton.do {
            $0.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            $0.setTitle(" 리뷰 작성", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(presentReviewWriteView), for: .touchUpInside)
        }
        backupButton.do {
            $0.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
            $0.setTitle(" 앱 지원", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
        }
    }
    override func addViews() {
        addSubview(reviewStackView)
        reviewStackView.addArrangedSubViews(
            reviewTitleStackView,
            reviewScoreStackView,
            divider,
            tapStackView,
            reviewCollectionView,
            reviewWriteStackView
        )
        reviewTitleStackView.addArrangedSubViews(
            reviewTitleLabel,
            UIView(),
            reviewMoreButton
        )
        reviewScoreStackView.addArrangedSubViews(
            reviewNumStackView,
            starStackView
        )
        reviewNumStackView.addArrangedSubViews(
            reviewNumLabel,
            reviewPerfectLabel
        )
        starStackView.addArrangedSubViews(
            starImageView,
            allStarLabel
        )
        tapStackView.addArrangedSubViews(
            tapLabel,
            UIView(),
            tapStarLabel
        )
        reviewWriteStackView.addArrangedSubViews(
            reviewWriteButton,
            UIView(),
            backupButton
        )
    }
    override func setLayout() {
        reviewStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        reviewTitleStackView.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        reviewScoreStackView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        divider.snp.makeConstraints {
            $0.height.equalTo(1)
        }
        reviewCollectionView.snp.makeConstraints {
            $0.height.equalTo(200)
        }
    }
    
    @objc
    func navigateToReview() {
        delegate?.navigateToReview()
    }
    
    @objc
    func presentReviewWriteView() {
        delegate?.presentReviewWriteView()
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width - 40,
            height: 200
        )
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        reviewCollectionView.do {
            $0.setCollectionViewLayout(
                layout,
                animated: true
            )
            $0.register(
                ReviewCell.self,
                forCellWithReuseIdentifier: ReviewCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = false
            $0.decelerationRate = .fast // 사용자가 손가락을 들어 올린 후 감속도를 결정
        }
    }
}

extension ReviewView: UICollectionViewDelegate {
    
}

extension ReviewView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 3
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReviewCell.identifier,
            for: indexPath
        ) as? ReviewCell else {
            return UICollectionViewCell()
        }
//        item.configure(
//            app: appList[indexPath.row]
//        )
        return item
    }
}

extension ReviewView: UIScrollViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        guard let layout = reviewCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        let index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        
        targetContentOffset.pointee = CGPoint(
            x: CGFloat(index) * cellWidthIncludingSpacing,
            y: 0
        )
    }
}

protocol ReviewDelegate: AnyObject {
    func navigateToReview()
    func presentReviewWriteView()
}

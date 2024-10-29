//
//  SecondSectionView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/29/24.
//

import UIKit

final class SecondSectionView: BaseView {
    
    private let appList = App.mockData
    
    private let contentStackView = UIStackView()
    private let headerStackView = UIStackView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let viewButton = UIButton()
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    weak var delegate: ChartDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initAttributes() {
        contentStackView.do {
            $0.axis = .vertical
        }
        headerStackView.do {
            $0.axis = .horizontal
        }
        titleLabel.do {
            $0.text = "필수 금융 앱"
            $0.font = .systemFont(ofSize: 22, weight: .bold)
        }
        subtitleLabel.do {
            $0.text = "App Store 에디터가 직접 골랐습니다"
            $0.textColor = .systemGray
        }
        viewButton.do {
            $0.setTitle("모두 보기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.addTarget(self, action: #selector(navigateToChart), for: .touchUpInside)
        }
    }
    
    override func addViews() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubViews(headerStackView, subtitleLabel, collectionView)
        headerStackView.addArrangedSubViews(titleLabel, UIView(), viewButton)
    }
    
    override func setLayout() {
        contentStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        headerStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        collectionView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(250)
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 80)
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        
        collectionView.do {
            $0.setCollectionViewLayout(layout, animated: true)
            $0.register(
                AppCollectionCell.self,
                forCellWithReuseIdentifier: AppCollectionCell.identifier
            )
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = .fast
            $0.isPagingEnabled = false
        }
    }
    
    @objc
    func navigateToChart() {
        delegate?.navigateToChart()
    }
}

extension SecondSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: AppCollectionCell.identifier, for: indexPath) as? AppCollectionCell else {
            return UICollectionViewCell()
        }
        item.configuration(app: appList[indexPath.row])
        return item
    }
}

extension SecondSectionView: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
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
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
    }
}

protocol ChartDelegate: AnyObject {
    func navigateToChart()
}

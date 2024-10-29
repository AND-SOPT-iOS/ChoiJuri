//
//  AppViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/28/24.
//

import UIKit

final class AppViewController: BaseViewController {
    
    private let scrollView = UIScrollView()
    private let contentStackView = UIStackView()
    private let firstCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let thirdSectionView = ThirdSectionView()
    private let secondSectionView = SecondSectionView()
    private let fourthSectionView = FourthSectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    override func initAttributes() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        contentStackView.do {
            $0.axis = .vertical
        }
    }
    
    override func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        contentStackView.addArrangedSubViews(firstCollectionView,  secondSectionView, thirdSectionView, fourthSectionView)
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
        }
        firstCollectionView.snp.makeConstraints {
            $0.height.equalTo(300)
        }
        secondSectionView.snp.makeConstraints {
            $0.height.equalTo(350)
        }
        thirdSectionView.snp.makeConstraints {
            $0.height.equalTo(350)
        }
        fourthSectionView.snp.makeConstraints {
            $0.height.equalTo(350)
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 300)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 40
        
        firstCollectionView.do {
            $0.setCollectionViewLayout(layout, animated: true)
            $0.register(
                FirstSectionViewCell.self,
                forCellWithReuseIdentifier: FirstSectionViewCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
            $0.isPagingEnabled = false
            $0.decelerationRate = .fast // 사용자가 손가락을 들어 올린 후 감속도를 결정
        }
    }
}

extension AppViewController: UICollectionViewDelegate {
    
}

extension AppViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionViewCell.identifier, for: indexPath) as? FirstSectionViewCell else {
            return UICollectionViewCell()
        }
        //        item.configuration(app: appList[indexPath.row])
        return item
    }
}

extension AppViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = firstCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
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

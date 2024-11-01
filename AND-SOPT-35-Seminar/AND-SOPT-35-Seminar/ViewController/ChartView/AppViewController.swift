//
//  AppViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/28/24.
//

import UIKit

final class AppViewController: BaseViewController {
    
    private let appList = App.mockData
    
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
        navigationItem.title = "금융"
//        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    override func initAttributes() {
        scrollView.do {
            $0.showsVerticalScrollIndicator = false
        }
        contentStackView.do {
            $0.axis = .vertical
        }
        secondSectionView.do {
            $0.delegate = self
        }
        thirdSectionView.do {
            $0.delegate = self
        }
        fourthSectionView.do {
            $0.delegate = self
            $0.detailDelegate = self
        }
    }
    
    override func addViews() {
        view.addSubview(
            scrollView
        )
        scrollView.addSubview(
            contentStackView
        )
        contentStackView.addArrangedSubViews(
            firstCollectionView,
            secondSectionView,
            thirdSectionView,
            fourthSectionView
        )
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
        firstCollectionView.snp.makeConstraints {
            $0.height.equalTo(320)
        }
        secondSectionView.snp.makeConstraints {
            $0.height.equalTo(320)
        }
        thirdSectionView.snp.makeConstraints {
            $0.height.equalTo(320)
        }
        fourthSectionView.snp.makeConstraints {
            $0.height.equalTo(320)
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width - 40,
            height: 300
        )
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        firstCollectionView.do {
            $0.setCollectionViewLayout(
                layout,
                animated: true
            )
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
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(
            detailViewController,
            animated: true
        )
    }
}

extension AppViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 4
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: FirstSectionViewCell.identifier,
            for: indexPath
        ) as? FirstSectionViewCell else {
            return UICollectionViewCell()
        }
        item.configure(
            app: appList[indexPath.row]
        )
        return item
    }
}

extension AppViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        guard let layout = firstCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
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

extension AppViewController: ChartDelegate {
    func navigateToChart() {
        let nextViewController = ChartViewController()
        navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
}

extension AppViewController: NavigateToDetailDelegate {
    func navigateToDetail() {
        let nextViewController = DetailViewController()
        navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }
}

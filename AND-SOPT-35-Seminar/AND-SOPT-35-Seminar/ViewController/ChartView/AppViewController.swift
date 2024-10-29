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
    private let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//    private let firstSectionView = FirstSectionView()
    private let secondSectionView = SecondSectionView()
    private let thirdSectionView = ThirdSectionView()
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
        contentStackView.addArrangedSubViews(/*firstSectionView,*/ firstCollectionView,  secondSectionView, thirdSectionView, fourthSectionView)
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
//        firstSectionView.snp.makeConstraints {
//            $0.height.equalTo(300)
//        }
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

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
    
//    private let chartCellView = ChartCellView()
    
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
                ChartCollectionCell.self,
                forCellWithReuseIdentifier: ChartCollectionCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }
    }
}

extension SecondSectionView: UICollectionViewDelegate {
    
}

extension SecondSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionCell.identifier, for: indexPath) as? ChartCollectionCell else {
            return UICollectionViewCell()
        }
        item.configuration(app: appList[indexPath.row])
        return item
    }
}

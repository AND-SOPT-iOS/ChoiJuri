//
//  PhotoViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/26/24.
//

import UIKit

class PhotoViewController: BaseViewController {
    
    private lazy var collectionView = UICollectionView(
        frame: .zero, 
        collectionViewLayout: UICollectionViewFlowLayout()
        )
    private let photoList = Photo.photos

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func addViews() {
        view.addSubview(collectionView)
    }
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 6) / 3
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(
                PhotoCell.self,
                forCellWithReuseIdentifier: PhotoCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate {
    
}
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        item.configuration(photo: photoList[indexPath.row])
        return item
    }
}

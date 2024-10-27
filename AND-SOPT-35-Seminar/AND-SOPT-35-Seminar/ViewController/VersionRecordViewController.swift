//
//  VersionRecordViewController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/17/24.
//

import UIKit

final class VersionRecordViewController: BaseViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initAttributes() {
        titleLabel.do {
            $0.text = "버전 기록 보기 !!!!"
        }
    }
    
    override func addViews() {
        view.addSubview(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

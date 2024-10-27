//
//  DividerView.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/27/24.
//

import UIKit

final class DividerView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

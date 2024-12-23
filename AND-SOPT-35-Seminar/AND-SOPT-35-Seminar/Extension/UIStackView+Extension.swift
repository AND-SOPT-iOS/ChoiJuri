//
//  UIStackView+Extension.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubViews(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
    
}

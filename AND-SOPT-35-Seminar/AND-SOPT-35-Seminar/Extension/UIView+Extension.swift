//
//  UIView+Extension.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 10/16/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
}

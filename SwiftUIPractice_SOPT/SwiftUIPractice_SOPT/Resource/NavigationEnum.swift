//
//  NavigationEnum.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import Foundation

enum NavigationEnum: Hashable {
    case detail
    case chart
    
    var title: String {
        switch self {
        case .detail:
            "detail"
        case .chart:
            "chart"
        }
    }
}

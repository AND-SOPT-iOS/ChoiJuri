//
//  NavigationDomain.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/8/25.
//

import Foundation

// 아마 selectedTab 정도는 여기서 관리할 수 있을 듯
//struct NavigationState {
//    var path: [ViewType] = []
//}

enum NavigationIntent {
    case push(ViewType)
    case pop(Int)
}

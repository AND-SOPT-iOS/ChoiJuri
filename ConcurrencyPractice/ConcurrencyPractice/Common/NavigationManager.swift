//
//  NavigationManager.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/8/25.
//

import SwiftUI

enum ViewType: Hashable {
    case detail(code: String)
}

final class NavigationManager: ObservableObject {
    
    @Published var path : [ViewType] = []
//    @Published private(set) var state = NavigationState()
    
    @ViewBuilder
    func build(_ view: ViewType) -> some View {
        switch view {
        case .detail(let code):
            MovieDetailView(movieCode: code)
        }
    }
    
    func dispatch(_ intent: NavigationIntent) {
        switch intent {
        case .push(let view):
            path.append(view)
        case .pop(let depth):
            path.removeLast(depth)
        }
    }

}

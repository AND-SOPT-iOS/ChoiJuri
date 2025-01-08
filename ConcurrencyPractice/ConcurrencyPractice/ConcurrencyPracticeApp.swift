//
//  ConcurrencyPracticeApp.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

@main
struct ConcurrencyPracticeApp: App {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationManager.path) {
                ContentView()
                    .navigationDestination(for: ViewType.self) { view in
                        navigationManager.build(view)
                    }
                    .environmentObject(navigationManager)
            }
        }
    }
}

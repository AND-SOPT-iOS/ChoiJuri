//
//  MainView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct MainView: View {
    @State private var navigationValue: NavigationEnum?
    
    var body: some View {
        ScrollView {
            VStack {
                // 첫번 째 섹션
                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        HStack {
                            FirstSectionView()
                            FirstSectionView()
                            FirstSectionView()
                            FirstSectionView()
                        }
                    }
                    .scrollTargetLayout()
                    .scrollIndicators(.hidden)
                }
                .scrollTargetBehavior(.viewAligned)
                // 필수 금융 앱
                AppChartView(title: "필수 금융 앱", description: "App Store 에디터가 직접 골랐습니다.")
                // 유료 앱
                AppChartView(title: "유료 순위", description: nil)
                // 무료 앱 순위
                AppChartView(title: "무료 순위", description: nil)
            }
        }
        .scrollIndicators(.hidden)
        .navigationDestination(for: NavigationEnum.self) { destination in
            
            switch destination {
            case .detail:
                TossDetailView()
            case .chart:
                ChartView()
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}

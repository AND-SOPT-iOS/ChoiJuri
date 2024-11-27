//
//  ChartView.swift
//  SoptSwiftUIPractice
//
//  Created by 최주리 on 11/27/24.
//

import SwiftUI

struct ChartView: View {
    let appList: [AppEntity] = AppEntity.appList
    
    var body: some View {
        NavigationStack {
            VStack {
                List(appList) { app in
                    ChartCell(app: app)
                }
                .listStyle(.plain)
                .padding(.horizontal, -20)
                
            }
            .navigationTitle("인기 차트")
            
        }
    }
}

#Preview {
    ChartView()
}

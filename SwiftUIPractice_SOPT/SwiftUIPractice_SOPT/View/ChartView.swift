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
        VStack {
            List(appList) { app in
                NavigationLink(value: NavigationEnum.detail, label: {
                    ChartCell(app: app)
                        .padding(.leading, 20)
                })
            }
            .listStyle(.plain)
            
            
        }
        .navigationTitle("인기 차트")
    }
}

#Preview {
    ChartView()
}

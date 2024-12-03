//
//  AppChartView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct AppChartView: View {
    private let appList: [AppEntity] = AppEntity.appList
    
//    @Binding var navigationValue: NavigationEnum?
    let title: String
    let description: String?
    var isRanking: Bool {
        if description == nil {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                
//                NavigationLink(destination: {
//                    ChartView()
//                }, label: {
//                    Text("모두 보기")
//                })
                
                NavigationLink(value: NavigationEnum.chart, label: {
                    Text("모두 보기")
                })
//                Button(action: {
//                    navigationValue = .chart
//                }, label: {
//                    
//                })
            }
            .padding(.horizontal)
            if !isRanking {
                Text(description!)
                    .padding(.leading)
            }
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack {
                        VStack {
                            NavigationLink(value: NavigationEnum.detail, label: {
                                ChartCell(app: appList[0], isRanking: isRanking)
                            })
                            ChartCell(app: appList[1], isRanking: isRanking)
                            ChartCell(app: appList[2], isRanking: isRanking)
                        }
                        VStack {
                            ChartCell(app: appList[3], isRanking: isRanking)
                            ChartCell(app: appList[4], isRanking: isRanking)
                            ChartCell(app: appList[5], isRanking: isRanking)
                        }
                        VStack {
                            ChartCell(app: appList[6], isRanking: isRanking)
                            ChartCell(app: appList[7], isRanking: isRanking)
                            ChartCell(app: appList[8], isRanking: isRanking)
                        }
                    }
                }
                .scrollTargetLayout()
                .scrollIndicators(.hidden)
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}
//
//#Preview {
//    AppChartView(title: "필수 금융 앱", description: "App Store 에디터가 직접 골랐습니다")
//}

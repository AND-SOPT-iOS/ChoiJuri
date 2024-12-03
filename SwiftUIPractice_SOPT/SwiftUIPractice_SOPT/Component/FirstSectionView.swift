//
//  FirstSectionView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct FirstSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("새로운 앱")
                .font(.system(size: 14))
                .foregroundStyle(.blue)
            Text("토스")
                .font(.system(size: 22))
            Text("금융이 쉬워진다")
            ZStack {
                Image(.appBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 10))
                VStack {
                    Spacer()
                    ChartCell(app: .init(id: UUID(), iconImage: .thumbnail, ranking: 0, title: "토스", subTitle: "당신 근처의 지역 생활 커뮤니티", category: "소셜미디어", downloadState: .download), isRanking: false, isFirstSection: true)
                }
            }
            .frame(width: 370, height: 300)
        }
        .padding()
    }
}

#Preview {
    FirstSectionView()
}

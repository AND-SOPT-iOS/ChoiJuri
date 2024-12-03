//
//  ChartCell.swift
//  SoptSwiftUIPractice
//
//  Created by 최주리 on 11/23/24.
//

import SwiftUI

struct ChartCell: View {
    
    var app: AppEntity = .init(id: UUID(), iconImage: .hyundaicard1, ranking: 0, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티", category: "소셜미디어", downloadState: .update)
    var isRanking: Bool = false
    var isFirstSection: Bool = false
    
    var body: some View {
        HStack(spacing: 15)  {
            Image(uiImage: app.iconImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            if isRanking {
                Text("\(app.ranking)")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            VStack(alignment: .leading) {
                Text("\(app.title)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(isFirstSection ? .white : .primary)
                Text("\(app.subTitle)")
                    .font(.system(size: 14))
                    .foregroundStyle(isFirstSection ? .white : .primary)
                    .lineLimit(2)
            }
            Spacer()
            Button(action: {
                
            }, label: {
                switch app.downloadState {
                case .installed:
                    BlueButton(title: "열기")
                case .download:
                    BlueButton(title: "받기")
                case .redownload:
                    Image(systemName: "icloud.and.arrow.down")
                        .font(.system(size: 22))
                        .foregroundStyle(.blue)
                        .padding(.trailing, 20)
                case .update:
                    BlueButton(title: "업데이트")
                }
            })
        
        }
        .padding()
        .padding(.horizontal, 10)
        .frame(width: 420)
    }
}

#Preview {
    ChartCell()
}

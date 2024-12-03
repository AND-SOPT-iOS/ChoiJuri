//
//  ChartCell.swift
//  SoptSwiftUIPractice
//
//  Created by 최주리 on 11/23/24.
//

import SwiftUI

struct ChartCell: View {
    
    var app: AppEntity = AppEntity(id: UUID(), iconImage: UIImage(systemName: "applelogo")!, ranking: 1, title: "당근", subTitle: "당신 근처의 지역 생활 커뮤니티", category: "소셜미디어", downloadState: .redownload)
    
    var body: some View {
        HStack(spacing: 15)  {
            Image(uiImage: app.iconImage)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text("\(app.ranking)")
                .font(.system(size: 20, weight: .bold))
            VStack(alignment: .leading) {
                Text("\(app.title)")
                    .font(.system(size: 18, weight: .bold))
                Text("\(app.subTitle)")
                    .font(.system(size: 14))
                    .lineLimit(2)
            }
            Spacer()
            Button(action: {
                
            }, label: {
                switch app.downloadState {
                case .installed:
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 35)
                        .foregroundStyle(Color(uiColor: .systemGray5))
                        .overlay {
                            Text("열기")
                                .foregroundStyle(.blue)
                        }
                case .download:
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 35)
                        .foregroundStyle(Color(uiColor: .systemGray5))
                        .overlay {
                            Text("받기")
                                .foregroundStyle(.blue)
                        }
                case .redownload:
                    Image(systemName: "icloud.and.arrow.down")
                        .font(.system(size: 22))
                        .foregroundStyle(.blue)
                        .padding(.trailing, 20)
                case .update:
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 35)
                        .foregroundStyle(Color(uiColor: .systemGray5))
                        .overlay {
                            Text("업데이트")
                                .foregroundStyle(.blue)
                        }
                }
            })
        
        }
        .padding()
        .padding(.horizontal, 10)
    }
}

#Preview {
    ChartCell()
}

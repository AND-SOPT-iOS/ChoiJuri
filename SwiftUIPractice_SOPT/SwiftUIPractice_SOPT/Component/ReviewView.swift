//
//  ReviewView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct ReviewView: View {
    
    let title: String
    let date: String
    let writer: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 5)
            HStack {
                Text("★★★★☆")
                Text(date)
                Text("· \(writer)")
            }
            Text(content)
                .lineLimit(5)
        }
        .frame(width: UIScreen.main.bounds.width - 70, height: 200)
        .padding()
        .background(Color(uiColor: .systemGray5))
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    ReviewView(title: "??? 뭐야 내 토스 돌려줘요", date: "9월 27일", writer: "림림심", content: "어쩌구 저쩌구 토스는 어떻게 어쩌궁ddddddddddddddddddddddddddddddddddddddddddddddddddd")
}

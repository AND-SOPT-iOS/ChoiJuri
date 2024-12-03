//
//  BlueButton.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 12/3/24.
//

import SwiftUI

struct BlueButton: View {
    let title: String
    let tapAction: (() -> Void)?
    
    init(
        title: String,
        tapAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.tapAction = tapAction

    }
    
    var body: some View {
        Button {
            tapAction?()
        } label: {
            HStack {
                Text("\(title)")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, title == "업데이트" ? 10 : 20)
            .padding(.vertical, 5)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 20))
            .frame(width: 100, height: 50)
        }
        
    }
}

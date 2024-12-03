//
//  LazyVGridExampleView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 11/30/24.
//

import SwiftUI

struct LazyVGridExampleView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let rows = [GridItem(.fixed(80))]
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<30) { num in
                        Circle()
                            .foregroundStyle(.red)
                    }
                }
            }
            .ignoresSafeArea()
            LazyVGrid(columns: columns) {
                ForEach(0..<30) { num in
                    Rectangle()
                        .frame(height: 130)
                        .foregroundStyle(.blue)
                }
            }
            .padding(5)
        }
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    LazyVGridExampleView()
}

//
//  DetailView.swift
//  SwiftUIPractice_SOPT
//
//  Created by 최주리 on 11/30/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var path: NavigationPath
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("back to root") {
                path.removeLast(2)
            }
            Button("present sheet") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, content: {
            VStack {
                Button("x") {
                    isPresented = false
                }
                Text("sheet view!!!!")
            }
        })
    }
}

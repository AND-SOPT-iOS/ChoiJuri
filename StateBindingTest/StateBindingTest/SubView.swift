//
//  SubView.swift
//  StateBindingTest
//
//  Created by 최주리 on 12/2/24.
//

import SwiftUI

struct SubView: View {
    @Binding var number: Int
    @Binding var show: Bool
    
    var body: some View {
        Text("\(number)")
            .onTapGesture {
                show.toggle()
            }
    }
}

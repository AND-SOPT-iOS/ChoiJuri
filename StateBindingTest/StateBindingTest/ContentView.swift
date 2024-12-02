//
//  ContentView.swift
//  StateBindingTest
//
//  Created by 최주리 on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var num: Int = 0 {
        didSet {
            show = true
        }
    }
    @State var show: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .onTapGesture {
//                    show.toggle()
                    num = 4
                }
            
//            Text("\(num)")
        }
        .padding()
        .fullScreenCover(isPresented: $show, content: {
            SubView(number: $num, show: $show)
        })
    }
}

#Preview {
    ContentView()
}

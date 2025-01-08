//
//  ContentView.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store: BoxOfficeStore = BoxOfficeStore()
    @EnvironmentObject private var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            
            List(store.state.movies, id: \.self) { movie in
                BoxOfficeCell(movie: movie)
                    .onTapGesture {
                        navigationManager.dispatch(.push(.detail(code: movie.movieCd)))
                    }
            }
            
            if store.state.isLoading {
                ProgressView()
            }
            
        }
        .onAppear {
            store.dispatch(.onAppear)
        }
        .navigationTitle("어제의 박스오피스")
    }
}

#Preview {
    ContentView()
}

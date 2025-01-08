//
//  ContentView.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct ContentView: View {
//    private let boxOfficeService = BoxOfficeService()
//    
//    @State private var movieList: [BoxOffice] = []
//    @State private var movie: Movie?
    
    @StateObject private var store: BoxOfficeStore = BoxOfficeStore()
    
    var body: some View {
        ZStack {
            
            List(store.state.movies, id: \.self) { movie in
                BoxOfficeCell(movie: movie)
                    .onTapGesture {
                        store.dispatch(.movieSelected(movie.movieCd))
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
//        .navigationDestination(item: $store.state.movie) { movie in
//            MovieDetailView(movie: movie)
//        }
    }
}

#Preview {
    ContentView()
}

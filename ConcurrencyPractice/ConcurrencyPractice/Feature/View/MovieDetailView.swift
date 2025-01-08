//
//  MovieDetailView.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var store = BoxOfficeStore()
    
    let movieCode: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("\(store.state.movie.movieNm) (\(store.state.movie.openDt))")
                Text("상영시간: \(store.state.movie.showTm)분")
                HStack {
                    Text("장르: ")
                    ForEach(store.state.movie.genres, id: \.self) { genre in
                        Text("\(genre.genreNm) ")
                    }
                }
            }
            
            if store.state.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            store.dispatch(.movieSelected(movieCode))
        }
    }
}

#Preview {
    MovieDetailView(movieCode: "")
}

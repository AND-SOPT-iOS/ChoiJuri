//
//  MovieDetailView.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(movie.movieNm) (\(movie.openDt))")
            Text("상영시간: \(movie.showTm)분")
            HStack {
                Text("장르: ")
                ForEach(movie.genres, id: \.self) { genre in
                    Text("\(genre.genreNm) ")
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(
        movie: .init(
            movieCd: "",
            movieNm: "광해",
            showTm: "131",
            openDt: "2020-11-11",
            genres: [
                .init(genreNm: "드라마"),
                .init(genreNm: "액션")
            ]
        )
    )
}

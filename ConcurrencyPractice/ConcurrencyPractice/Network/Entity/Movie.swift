//
//  Movie.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

struct MovieResponse: Decodable {
    let movieInfoResult: MovieResult
}

struct MovieResult: Decodable {
    let movieInfo: Movie
}

struct Movie: Decodable, Hashable {
    let movieCd: String
    let movieNm: String
    let showTm: String
    let openDt: String
    let genres: [Genre]
}

struct Genre: Decodable, Hashable {
    let genreNm: String
}

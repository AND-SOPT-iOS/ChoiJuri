//
//  ContentView.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    private let boxOfficeService = BoxOfficeService()
    
    @State private var movieList: [BoxOffice] = []
    @State private var movie: Movie?
    
    var body: some View {
        List(movieList, id: \.self) { movie in
            BoxOfficeCell(movie: movie)
                .onTapGesture {
                    Task {
                        self.movie = try await fetchOneMovie(code: movie.movieCd)
                    }
                }
        }
        .navigationDestination(item: $movie) { movie in
            MovieDetailView(movie: movie)
        }
        .task {
            do {
                movieList = try await fetchMovieList()
            } catch {
                print("error!")
            }
        }
        .navigationTitle("어제의 박스오피스")
    }
    
    //MARK: - Functions
    private func fetchMovieList() async throws -> [BoxOffice] {
        return try await boxOfficeService
            .fetchBoxOfficeList(date: calculateDate())
            .boxOfficeResult
            .dailyBoxOfficeList
    }
    
    private func fetchOneMovie(code: String) async throws -> Movie {
        return try await boxOfficeService
            .fetchMovieInfo(code: code)
            .movieInfoResult
            .movieInfo
    }
    
    private func calculateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        return formatter.string(from: yesterday!)
    }
}

#Preview {
    ContentView()
}

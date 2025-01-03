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
    
    var body: some View {
        List(movieList, id: \.self) { movie in
            BoxOfficeCell(movie: movie)
        }
        .task {
            do {
                movieList = try await boxOfficeService
                    .fetchBoxOfficeList(date: "20241212")
                    .boxOfficeResult
                    .dailyBoxOfficeList
            } catch {
                print("error!")
            }
        }
    }
}

#Preview {
    ContentView()
}

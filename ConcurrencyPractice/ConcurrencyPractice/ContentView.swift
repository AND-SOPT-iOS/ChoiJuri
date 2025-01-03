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
                    .fetchBoxOfficeList(date: calculateDate())
                    .boxOfficeResult
                    .dailyBoxOfficeList
            } catch {
                print("error!")
            }
        }
        .navigationTitle("어제의 박스오피스")
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

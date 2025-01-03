//
//  BoxOfficeCell.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import SwiftUI

struct BoxOfficeCell: View {
    let movie: BoxOffice
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(movie.rank)위")
            Text(movie.movieNm)
            Text("개봉일: \(movie.openDt)")
        }
    }
}

#Preview {
    BoxOfficeCell(movie: .init(rank: "1", movieNm: "하얼빈", openDt: "2024-01-01"))
}

//
//  BoxOfficeDomain.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/8/25.
//

import Foundation

// viewModel에서 published로 선언하는 변수 느낌이라고 이해함
struct BoxOfficeState {
    var movies: [BoxOffice] = []
    var movie: Movie = .init(
        movieCd: "",
        movieNm: "하얼빈",
        showTm: "131",
        openDt: "2024",
        genres: []
    )
    var isLoading: Bool = false
    var error: String? = nil
}

// 사용자가 할 수 있는 행동의 모든 경우의 수 (action)
enum BoxOfficeIntent {
    case onAppear
    case movieSelected(String)
}

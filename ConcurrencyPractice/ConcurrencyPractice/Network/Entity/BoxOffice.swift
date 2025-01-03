//
//  BoxOffice.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [BoxOffice]
}

struct BoxOffice: Decodable, Hashable {
    let rank: String
    let movieNm: String
    let openDt: String
    let movieCd: String
}

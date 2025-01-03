//
//  BaseAPI.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import Foundation

import Moya

enum BaseAPI {
    case searchDailyBoxOfficeList(date: String)
    case searchMovieInfo(code: String)
}

extension BaseAPI: TargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("url error!")
        }
        return url
    }
    
    var path: String {

        guard let key = Bundle.main.infoDictionary?["KEY"] as? String
        else {
            fatalError("key error!")
        }
        let keyString = ".json?key=\(key)"
        
        switch self {
        case .searchDailyBoxOfficeList(let date):
            return "/boxoffice/searchDailyBoxOfficeList\(keyString)&targetDt=\(date)"
        case .searchMovieInfo(let code):
            return "/movie/searchMovieInfo\(keyString)&movieCd=\(code)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchDailyBoxOfficeList, .searchMovieInfo:
            .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .searchDailyBoxOfficeList, .searchMovieInfo:
            .requestPlain
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}

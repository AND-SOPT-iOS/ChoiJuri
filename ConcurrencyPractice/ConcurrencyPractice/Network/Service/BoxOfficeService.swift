//
//  BoxOfficeService.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import Foundation

import Moya

protocol BoxOfficeServiceProtocol {
    func fetchBoxOfficeList(date: String) async throws -> BoxOfficeResponse
}

final class BoxOfficeService: BoxOfficeServiceProtocol {
    
    private let provider = MoyaProvider<BaseAPI>(plugins: [MoyaLoggingPlugin()])
    
    func fetchBoxOfficeList(date: String) async throws -> BoxOfficeResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.searchDailyBoxOfficeList(date: date)) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(BoxOfficeResponse.self, from: response.data)
                        continuation.resume(returning: data)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }

}

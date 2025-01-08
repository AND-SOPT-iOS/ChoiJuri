//
//  BoxOfficeService.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/3/25.
//

import Foundation

import Moya

protocol BoxOfficeServiceProtocol {
    func fetchBoxOfficeList() async throws -> BoxOfficeResponse
    func fetchMovieInfo(code: String) async throws -> MovieResponse
}

actor BoxOfficeService: BoxOfficeServiceProtocol {
    
    private let provider = MoyaProvider<BaseAPI>(plugins: [MoyaLoggingPlugin()])
    
    private func calculateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        
        return formatter.string(from: yesterday!)
    }
    
    func fetchBoxOfficeList() async throws -> BoxOfficeResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.searchDailyBoxOfficeList(date: calculateDate())) { result in
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
    
    func fetchMovieInfo(code: String) async throws -> MovieResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.searchMovieInfo(code: code)) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try JSONDecoder().decode(MovieResponse.self, from: response.data)
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

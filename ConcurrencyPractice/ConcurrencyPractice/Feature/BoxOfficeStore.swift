//
//  BoxOfficeStore.swift
//  ConcurrencyPractice
//
//  Created by 최주리 on 1/8/25.
//

import Foundation

// 어쩌면 뷰모델이랑 비슷한 역할인데
// 변수 부분을 state로 관리하고
// 함수 부분을 intent로 관리하는 느낌이랄까 ? ? ?
@MainActor
final class BoxOfficeStore: ObservableObject {
    
    @Published private(set) var state: BoxOfficeState
    private let service: BoxOfficeService
    
    init(
        state: BoxOfficeState = BoxOfficeState(),
        service: BoxOfficeService = BoxOfficeService()
    ) {
        self.state = state
        self.service = service
    }

    func dispatch(_ intent: BoxOfficeIntent) {
        switch intent {
        case .onAppear:
            Task {
                do {
                    state.isLoading = true
                    
                    state.movies = try await service
                        .fetchBoxOfficeList()
                        .boxOfficeResult
                        .dailyBoxOfficeList
                    
                    state.isLoading = false
                } catch {
                    state.error = error.localizedDescription
                }
            }
        case .movieSelected(let code):
            Task {
                do {
                    state.isLoading = true
                    
                    state.movie = try await service
                        .fetchMovieInfo(code: code)
                        .movieInfoResult
                        .movieInfo
                    
                    state.isLoading = false
                } catch {
                    state.error = error.localizedDescription
                }
            }
        }
    }
    
    
}

//
//  LoginService.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/2/24.
//

import Alamofire
import Foundation

final class LoginService {
    
    func login(
        id: String,
        pw: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/login"
        let parameters = LoginRequest(username: id, password: pw)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
            .validate()
            .response { [weak self] response in
                guard let statusCode = response.response?.statusCode,
                      let data = response.data,
                      let self
                else {
                    completion(.failure(.unknownError))
                    return
                }
                
                switch response.result {
                case .success:
                    let token = self.decodeToken(data: data)
                    completion(.success(token))
                    // token ud에 저장
                    UserDefaults.standard.set(token, forKey: "token")
                    UserDefaults.standard.set(id, forKey: "name")
                    print(token)
                case .failure:
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
    }
    
    //MARK: - Decode
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data)
        else {
            return ""
        }
        
        return errorResponse.code
    }
    
    func decodeToken(data: Data) -> String {
        guard let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
        else {
            return "error"
        }
        return response.result.token
    }
    
    //MARK: - ErrorHandler
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "01"):
            return .expressionError
        case (400, "02"):
            return .wrongPasswordError
        case (403, "01"):
            return .wrongPasswordError
        case (404, "00"):
            return .invalidURL
        default:
            return .unknownError
        }
    }
}

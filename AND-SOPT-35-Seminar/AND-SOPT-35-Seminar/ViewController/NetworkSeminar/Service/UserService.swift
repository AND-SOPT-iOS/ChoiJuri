//
//  UserService.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/2/24.
//

import Alamofire
import Foundation

final class UserService {
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user"
        let parameters = RegisterRequest(
            username: username,
            password: password,
            hobby: hobby
        )
        
        /// Request시 url, method, parameters, 인코딩 방식을 파라미터로 넘겨주어야 함.
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate() /// 200번대가 아닐 경우 failure로 넘어감
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
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func loadMyHobby(completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user/my-hobby"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: ["token": "\(token)"]
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
                let hobby = self.decodeHobby(data: data)
                UserDefaults.standard.set(hobby, forKey: "hobby")
                completion(.success(hobby))
                print(hobby)
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func searchOtherHobby(
        num: Int,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let url = Environment.baseURL + "/user/\(num)/hobby"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        
        AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: ["token": "\(token)"]
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
                let hobby = self.decodeHobby(data: data)
                completion(.success(hobby))
                print(hobby)
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func changeUser(
        hobby: String,
        password: String, 
        completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let parameters = UserRequest(hobby: hobby, password: password)
        
        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: ["token": "\(token)"]
        )
        .validate()
        .response { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                UserDefaults.standard.set(hobby, forKey: "hobby")
                completion(.success(true))
            case .failure:
                guard let data = response.data else { return }
                        
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - Decode

    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
    
    func decodeHobby(data: Data) -> String {
        guard let response = try? JSONDecoder().decode(Hobbyrequest.self, from: data)
        else {
            return "error"
        }
        return response.result.hobby
    }
    
    //MARK: - ErrorHandler
    
    /// 서버의 명세서 기반으로 에러 처리를 진행해줌
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (401, "00"):
            return .invalidTokenInHeader
        case (403, "00"):
            return .invalidToken
        case (404, ""):
            return .invalidURL
        case (404, "00"):
            return .invalidRequest
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
}

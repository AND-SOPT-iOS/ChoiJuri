//
//  LoginResponse.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/2/24.
//

import Foundation

struct LoginResponse: Decodable {
    let result: Token
    
    struct Token: Decodable {
        let token : String
    }
}

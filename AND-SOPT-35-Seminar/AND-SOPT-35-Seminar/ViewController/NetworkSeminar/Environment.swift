//
//  Environment.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/8/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}

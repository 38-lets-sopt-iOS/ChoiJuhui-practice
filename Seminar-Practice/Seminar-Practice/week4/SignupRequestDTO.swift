//
//  SignUpRequestDTO.swift
//  Seminar-Practice
//
//  Created by h2e on 5/2/26.
//

import Foundation

struct SignupRequestDTO: Codable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

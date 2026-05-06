//
//  SignUpResponseDTO.swift
//  Seminar-Practice
//
//  Created by h2e on 5/2/26.
//

import Foundation

struct SignupResponseDTO: Codable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}

struct ErrorResponseDTO: Codable {
    let path: String
    let timestamp: String
}

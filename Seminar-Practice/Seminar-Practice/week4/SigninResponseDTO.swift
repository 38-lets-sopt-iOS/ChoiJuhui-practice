//
//  SigninResponseDTO.swift
//  Seminar-Practice
//
//  Created by h2e on 5/4/26.
//

import Foundation

struct SigninResponseDTO: Codable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: SigninData?
    let meta: ErrorResponseDTO?
}

struct SigninData: Codable {
    let userId:Int
}

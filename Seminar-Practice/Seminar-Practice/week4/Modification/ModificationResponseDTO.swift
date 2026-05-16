//
//  ModificationResponseDTO.swift
//  Seminar-Practice
//
//  Created by h2e on 5/5/26.
//

import Foundation

struct UserInfoResponseDTO: Codable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfoData?
    let meta: ErrorResponseDTO?
}

typealias ModificationResponseDTO = UserInfoResponseDTO

struct UserInfoData: Codable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

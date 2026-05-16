//
//  ModificationAPIService.swift
//  Seminar-Practice
//
//  Created by h2e on 5/5/26.
//

import Foundation

final class ModificationAPIService {
    static let shared = ModificationAPIService()
    private init () { }
    
    // 조회 (GET)
    func getUserInfo(userId:Int) async throws -> UserInfoResponseDTO {
        let request = try makeGetRequest(userId: userId)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        return try JSONDecoder().decode(UserInfoResponseDTO.self, from: data)
    }
    
    private func makeGetRequest(userId: Int) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let path = "api/v1/users/\(userId)"
        let url = baseURL + path
        
        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedURL)
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type" : "application/json"]
            header.forEach {
                request.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        
        return request
    }
    
    // 수정 (PATCH)
    
    private func makeRequestBody(name: String?, email: String?, age: Int?) -> Data? {
        do {
            let data = ModificationRequestDTO(name: name, email: email, age: age)
            let encoder = JSONEncoder()
            return try encoder.encode(data)
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(userId: Int, body: Data) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let path = "api/v1/users/\(userId)"
        let url = baseURL + path
        
        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }
        var request = URLRequest(url: encodedURL)
        
        request.httpMethod = "PATCH"
        
        let header = ["Content-Type" : "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        request.httpBody = body
        
        return request
    }
    
    func patchModification(userId: Int, name: String?, email: String?, age: Int?) async throws -> ModificationResponseDTO {
        guard let body = makeRequestBody(name: name, email: email, age: age) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = try makeRequest(userId: userId, body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        let decoded = try JSONDecoder().decode(ModificationResponseDTO.self, from: data)
        return decoded
    }
    
    private func configureHTTPError(errorCode: Int) -> NetworkError {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}

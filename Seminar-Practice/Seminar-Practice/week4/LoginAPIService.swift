//
//  LoginAPI.swift
//  Seminar-Practice
//
//  Created by h2e on 5/2/26.
//

import Foundation

final class LoginAPIService {
    static var shared = LoginAPIService()
    private init() { }
    
    private func makeRequestBody(loginId: String, password: String) -> Data? {
        do {
            let data = SigninRequestDTO(loginId: loginId, password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "api/v1/auth/signin"
        let url = baseUrl + path
        print(url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = "POST"
        
        let header = ["Content-Type" : "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }
    
    func postsignin(loginId: String, password: String) async throws -> SigninResponseDTO {
        
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = try makeRequest(body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response: \(response)")
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(SigninResponseDTO.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
}

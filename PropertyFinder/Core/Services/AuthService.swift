//
//  AuthService.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

protocol AuthServiceProtocal {
    func register(
        request: RegisterRequest
    ) async throws -> RegisterResponse
    
    func login(
        request: LoginRequest
    ) async throws -> LoginResponse
}

struct APIErrorResponse: Codable {
    let detail: String
}

final class AuthService: AuthServiceProtocal {
    func register(request: RegisterRequest) async throws -> RegisterResponse {
        guard let url = URL(
            string: "http://127.0.0.1:8000/register"
        ) else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        urlRequest.httpBody = try JSONEncoder()
            .encode(request)
        
        return try await APIClient.shared.request(
            urlRequest: urlRequest,
            responseType: RegisterResponse.self
        )
    }
    
    func login(request: LoginRequest) async throws -> LoginResponse {
        guard let url = URL(
            string: "http://127.0.0.1:8000/login"
        ) else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        urlRequest.httpBody = try JSONEncoder()
            .encode(request)
        
        return try await APIClient.shared.request(
            urlRequest: urlRequest,
            responseType: LoginResponse.self
        )
    }
}

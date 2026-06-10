//
//  File.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let message: String
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case message
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}

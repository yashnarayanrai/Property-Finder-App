//
//  ResquestResponse.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

struct RegisterRequest: Codable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
}

struct RegisterResponse: Codable {
    let message: String
}

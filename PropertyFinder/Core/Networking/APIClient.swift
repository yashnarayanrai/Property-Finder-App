//
//  APIClient.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

final class APIClient {
    
    static let shared = APIClient()
    
    private init() {}
    
    func request<T:Decodable>(
        urlRequest: URLRequest,
        responseType: T.Type
    ) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        print("Status Code:", httpResponse.statusCode)
        print("Response:", String(data: data, encoding: .utf8) ?? "")
        
                
        if 200...299 ~= httpResponse.statusCode {
            return try JSONDecoder().decode(
                T.self,
                from: data
            )
        }
        
        if let apiError = try? JSONDecoder().decode(
            APIErrorResponse.self,
            from: data
        ){
            throw NSError(
                domain: "", code: httpResponse.statusCode,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        apiError.detail
                ]
            )
        }
        
        throw URLError(.badServerResponse)
        
//        return try JSONDecoder().decode(T.self, from: data)
    }
}

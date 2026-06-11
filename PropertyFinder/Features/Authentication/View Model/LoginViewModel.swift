//
//  LoginViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var isLoading = false
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    
    private let authService : AuthServiceProtocal
    
    init(
        authService: AuthServiceProtocal = AuthService()
    ){
        self.authService = authService
    }
    
    func login() async {
        
        guard !email.isEmpty else {
            errorMessage = "Please enter email"
            return
        }

        guard !password.isEmpty else {
            errorMessage = "Please enter password"
            return
        }
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        // API Call
        
        do{
            
            let response = try await authService.login(
                request: LoginRequest(
                    email: email,
                    password: password
                )
            )
            
            print("Login Success")
            print(response)
            
            KeychainManager.shared.saveToken(response.accessToken)
            
            UserDefaults.standard.set(true, forKey: "isTermAppected")
            
            isLoggedIn =  true
        } catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
}

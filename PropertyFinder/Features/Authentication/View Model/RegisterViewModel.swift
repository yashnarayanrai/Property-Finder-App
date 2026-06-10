//
//  RegisterViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import Foundation

@MainActor
final class RegisterViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var registrationSuccess = false
    
    private let authService: AuthServiceProtocal
    
    init(
        authService: AuthServiceProtocal = AuthService()
    ) {
        self.authService = authService
    }
    
    func register() async {
        guard validateForm() else {
            return
        }
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let request = RegisterRequest(
                first_name: firstName,
                last_name: lastName,
                email: email,
                password: password
            )
            
            let response = try await authService
                .register(request: request)
            
            registrationSuccess = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    private func validateForm() -> Bool {
        
        guard !firstName.isEmpty else{
            errorMessage = "Enter first name"
            return false
        }
        
        guard !lastName.isEmpty else{
            errorMessage = "Enter last name"
            return false
        }
        
        guard !email.isEmpty else{
            errorMessage = "Enter email"
            return false
        }
        
        guard !password.isEmpty else{
            errorMessage = "Enter password"
            return false
        }
        
        return true
    }
}

//
//  RegisterView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 10/06/26.
//

import SwiftUI

struct RegisterView: View {
    
    let onRegisterSuccess: (String) -> Void
    @StateObject private var vm = RegisterViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            
            TextField(
                "First Name",
                text: $vm.firstName
            )
            
            TextField(
                "Last Name",
                text: $vm.lastName
            )
            
            TextField(
                "Email",
                text: $vm.email
            )
            .keyboardType(.emailAddress)
            
            SecureField(
                "Password",
                text: $vm.password
            )
            
            ActionButton(title: "Register", isPrimary: true, action: {
                Task {
                    await vm.register()
                    
                    if vm.registrationSuccess {
                        onRegisterSuccess(vm.email)
                    }
                }
            })
            
            if vm.isLoading{
                ProgressView()
            }
        }
        .padding()
        .alert( "Error",
            isPresented: Binding(
            get: { vm.errorMessage != nil},
            set: {_ in vm.errorMessage = nil }
            )
        ){
            Button("OK") {}
        } message: {
            Text(vm.errorMessage ?? "")
        }
    }
}

//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(onRegisterSuccess: {})
//    }
//}

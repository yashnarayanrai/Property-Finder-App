//
//  LoginView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 12/05/26.
//

import SwiftUI

struct LoginView: View {

    let onEmailSent: (String) -> Void
    @State private var isEmailSent = ""
    @State private var email = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                HStack{
                    Text("Sign in or sign up")
                        .font(.title).bold()
                    
                    Spacer()
                    
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(Color.theme.black)
                    }
                }
                
                Divider().background(Color.theme.gray.opacity(0.3))
                
                HStack(spacing: 12){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sign up to access fractional investment!")
                            .font(.headline)
                            .foregroundColor(Color.theme.primaryBlue)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Get exclusive access to properties and earn monthly income.")
                            .font(.caption)
                            .foregroundColor(Color.theme.black)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("SignUpIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 88, height: 88)
                        
                }
                .padding()
                .background(Color.theme.backgroundBanner)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                //                Email Input
                TextField("Email Address", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocapitalization(.none)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.theme.background)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))

                
                ActionButton(title: "Go!", isPrimary: true, useDefaultNativePadding: true){
                    dismiss()
                    
                    onEmailSent(email)
                }
                .disabled(email.isEmpty)
            }
            
            .padding(.horizontal)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
//        .navigationDestination(isPresented: $isEmailSent) {
//            CheckEmailView(email: email)
//        }
    }
}


//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}



//
//  CheckEmailView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 13/05/26.
//
//"https://property-finder-63cc3.firebaseapp.com")

import SwiftUI

struct CheckEmailView: View {
    
    let email: String
    
    @Binding var goToCheckEmail: Bool
    
    @State private var openMailApp = false
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {

                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.backward")
                        .font(.title3)
                        .foregroundColor(Color.theme.black)
                }

                Spacer()
            }
            Spacer()
            
            // Icon
            Image("EmailIcon")
            
            VStack(spacing: 12) {
                Text("Almost there!")
                    .font(.title2).bold()
                
                (
                    Text("We've sent an email ")
                    +
                    Text(email).fontWeight(.bold)
                    +
                    Text(" to activate your account.")
                )
                .foregroundColor(Color.theme.gray)
                .multilineTextAlignment(.center)
                
            }
            
            Spacer()
            
            // Open Mail Button
            ActionButton(title: "Open your mailbox", isPrimary: true, useDefaultNativePadding: true, action: {openMailApp = true})
            
            ActionButton(title: "Didn't not receive the email", isPrimary: false, useDefaultNativePadding: true, action: {print("Did't not receive")})
                       
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $openMailApp) {

            AcceptTermsView(goToCheckEmail: $goToCheckEmail)
        }
    }
}

struct CheckEmailView_Previews: PreviewProvider {
    static var previews: some View {
        CheckEmailView(email: "test@gmail.com",
                       goToCheckEmail: .constant(true))
    }
}

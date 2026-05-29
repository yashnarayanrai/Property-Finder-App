//
//  CouldNotVerifyYourAddressPopUp.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 29/05/26.
//

import SwiftUI

struct CouldNotVerifyYourAddressPopUp: View {
    @Binding var isPresented: Bool
    let goToEmail: () -> Void
    let backToSearch: () -> Void
    
    var body: some View {
        ZStack {
            Color.theme.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 16){
                VStack(spacing: 12){
                    
                    Image("Warning3")
                    
                    VStack(spacing: 4){
                        Text("We couldn't verify your address.")
                            .font(.title3).bold()
                        
                        Text("We have sent you an email with next steps.")
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }
                
                ActionButton(title: "Go to emails", isPrimary: true, action: {
                    goToEmail()
                })
                
                ActionButton(title: "Back to search", isPrimary: false, action: {
                    
                })
            }
            .padding(16)
            .foregroundColor(Color.theme.primaryText)
            .background(Color.theme.backgroundBanner)
            .cornerRadius(12)
            .shadow(radius: 20)
            .padding(.horizontal)
        }
    }
}

struct CouldNotVerifyYourAddressPopUp_Previews: PreviewProvider {
    static var previews: some View {
        CouldNotVerifyYourAddressPopUp(isPresented: .constant(true), goToEmail: {}, backToSearch: {})
    }
}

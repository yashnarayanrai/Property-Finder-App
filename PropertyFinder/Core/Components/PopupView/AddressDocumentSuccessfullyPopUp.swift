//
//  AddressDocumentSuccessfullyPopUp.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 29/05/26.
//

import SwiftUI

struct AddressDocumentSuccessfullyPopUp: View {
    @Binding var isPresented: Bool
    let onContinue: () -> Void
    
    var body: some View {
        ZStack {
            Color.theme.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 16){
                VStack(spacing: 12){
                    HStack{
                        Button(action: {
                            isPresented = false
                        }){
                            Spacer()
                            Image(systemName: "xmark")
                                .fontWeight(.regular)
                        }
                        
                    }
                    
                    Image("SuccessCheck2")
                    
                    VStack(spacing: 4){
                        Text("Your address document has successfully been verified!")
                            .font(.title3).bold()
                        
                        Text("You can continue with your investment.")
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }
                
                ActionButton(title: "Continue", isPrimary: true, action: {
                    
                    isPresented = false
                    onContinue()
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

struct AddressDocumentSuccessfullyPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddressDocumentSuccessfullyPopUp(isPresented: .constant(true), onContinue: { } )
    }
}

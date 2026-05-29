//
//  CheckingYourAddressDocumentPopUp.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 29/05/26.
//

import SwiftUI

struct CheckingYourAddressDocumentPopUp: View {
    var body: some View {
        ZStack {
            Color.theme.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
    //                showFailedPopup = false
                }
            
            VStack(spacing: 8){
                
                VStack(spacing: 12) {
                    Image("DocumentReview")
                    
                    VStack(spacing: 4){
                        Text("Checking your address document")
                            .font(.title3).bold()
                        
                        Text("This will only take a minute...")
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }
 
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 40)
            .background(Color.theme.backgroundBanner)
            .cornerRadius(12)
            .shadow(radius: 20)
            .padding(.horizontal)
        }
    }
}

struct CheckingYourAddressDocumentPopUp_Previews: PreviewProvider {
    static var previews: some View {
        CheckingYourAddressDocumentPopUp()
    }
}

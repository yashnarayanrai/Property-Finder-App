//
//  AddressDocumentInReviewPopUp.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 29/05/26.
//

import SwiftUI

struct AddressDocumentInReviewPopUp: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.theme.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 12){
                HStack{
                    Button(action: {
                        isPresented = false
                    }){
                        Spacer()
                        Image(systemName: "xmark")
                            .foregroundColor(Color.theme.primaryBlue)
                    }
                    
                }
                
                Image("EmploymentDetailIcon")
                
                VStack(spacing: 4){
                    Text("Address document in review")
                        .font(.title3).bold()
                    
                    Text("We are reviewing your address document and we hope to have you verified soon.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                
                
                
                HStack{
                    Image(systemName: "clock")
                    
                    Text("Average review time: 2-4 hours")
                        .font(.footnote)
                }
                .fontWeight(.regular)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .background(.white)
                .cornerRadius(12)
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

struct AddressDocumentInReviewPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddressDocumentInReviewPopUp(isPresented: .constant(true))
    }
}

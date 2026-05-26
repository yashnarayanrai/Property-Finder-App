//
//  IdentityDetails.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 25/05/26.
//

import SwiftUI

struct IdentityDetails: View {
    @Binding var currentCompletedStep: Int
    @Binding var activeStep: OnboardingStep
    @State private var employmentIndustry = ""
    @State private var streetAddress = ""
    
    
    var body: some View {
        VStack{
        
            VStack(alignment: .leading, spacing: 24){
                
                VStack(alignment: .leading, spacing: 16){
                    Text("Employer's address")
                        .font(.title3).bold()
                    Text("Please confirm your employer's address to ensure we have accurate information.")
                }
                
                VStack(alignment: .leading, spacing: 16){
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Country")
                            .font(.subheadline).bold()
                        
                        TextField("🇦🇪 United Arab Emirates", text: $streetAddress)
                            .padding()
                            .background(Color.theme.gray.opacity(0.22))
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Street address")
                            .font(.subheadline).bold()
                        
                        TextField("E.g 123 Hessa Street", text: $streetAddress)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Apartment/floor/unit")
                            .font(.subheadline).bold()
                        
                        TextField("E.g Unit 001", text: $streetAddress)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("City")
                            .font(.subheadline).bold()
                        
                        TextField("E.g Dubai", text: $streetAddress)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Postal Code")
                            .font(.subheadline).bold()
                        
                        TextField("E.g 000000", text: $streetAddress)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                }
                
            }
            .padding(.vertical, 8)
            .foregroundColor(Color.theme.primaryText)
            
            ActionButton(title: "Continue", isPrimary: true, action: {})
        }
    }
}


struct IdentityDetails_Previews: PreviewProvider {

    static var previews: some View {

        IdentityDetails(currentCompletedStep: .constant(2), activeStep: .constant(.identityVerification))
    }
}

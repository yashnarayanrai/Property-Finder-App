//
//  UploadYourPassport.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 28/05/26.
//

import SwiftUI

struct UploadYourPassport: View {
    @State private var showInfoSheet = false
    
    @Binding var currentCompletedStep: Int
    @Binding var activeStep: OnboardingStep
    
    @Environment(\.dismiss) var dismiss
    
//    Marks:- Guidelines
    
    private let passportGuidelines: [String] = [
        "Show all details including 2 lines at the bottom",
        "Ensure passport is not captured from another screen",
        "No glare or over-exposed photos",
        "No covered or cut-off photos"
    ]
    
    var body: some View {
        VStack {
            headerSection
            
            VStack(spacing: 24){
                SegmentedProgressBar(totalSteps: 2, currentStep: 2)
                
                detailSection
            }
            
            Spacer()
            
            ActionButton(title: "Verify passport", isPrimary: true, action: {
                currentCompletedStep = 4
                dismiss()
            })
            
        }
        .padding(16)
        .navigationBarBackButtonHidden(true)
        
        .sheet(isPresented: $showInfoSheet){
            VStack{
                VStack(spacing: 10){
                    HStack(alignment: .top){
                        Text("Why do we need to verify your passport?")
                            .font(.title3).bold()
                        
                        Spacer()
                        
                        Button(action: { showInfoSheet = false }){
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.regular)
                        }
                    }
                }
                .padding(16)
                
                Divider()
                
                VStack(alignment:.leading, spacing: 16){
                    Text("Your passport helps us confirm your identity and protect your account from fraud. This is a standard KYC and Anti-Money Laundering (AML) requirement set by the Dubai Financial Services Authority.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                Spacer(minLength: 0)
            }
            .foregroundColor(Color.theme.primaryText)
            .presentationDetents([.height(240)])
        }
    }
}

extension UploadYourPassport {
    
    private var headerSection: some View {
        
        HStack(spacing: 16) {
            
            Button(action: {
//                                handleBackNavigation()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.theme.black)
            }
            
            Spacer()
            
            Text("Upload your passport")
                .font(.title3.bold())
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .opacity(0)
        }
        .padding(.vertical, 16)
    }
    
    private var detailSection: some View {
        VStack(alignment: .leading, spacing: 24){
            VStack(alignment: .leading, spacing: 8){
                Text("Passport verification")
                    .font(.title3).bold()
                Text("We need this to register you as the legal owner of any property you invest in.")
                    .font(.callout)
                    .fontWeight(.regular)
                
                Button(action: { showInfoSheet = true }){
                    HStack(spacing: 4){
                        Text("Why do we need this?")
                            .font(.callout)
                            .underline()
                        
                        Image(systemName: "info.circle")
                            .font(.callout)
                    }
                    .foregroundColor(Color.theme.primaryBlue)
                }
            }
            guidlinesSection
        }
        .foregroundColor(Color.theme.primaryText)
    }
    
    private var guidlinesSection: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Passport upload guidelines")
                .font(.subheadline).bold()
            
            VStack(spacing: 16){
                ForEach(passportGuidelines, id: \.self){ guideline in
                    guidelineRow(text: guideline)
                }
            }
            
        }
        .padding(16)
        .foregroundColor(Color.theme.primaryText)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
    }
    
    private func guidelineRow(text: String) -> some View {
        HStack(alignment: .top, spacing: 8){
            Image(systemName: "checkmark.circle.fill")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.theme.gray.opacity(0.5))
            
            Text(text)
                .font(.subheadline)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct UploadYourPassport_Previews: PreviewProvider {
    static var previews: some View {
        UploadYourPassport(currentCompletedStep: .constant(4),activeStep: .constant(.identityVerification))
    }
}

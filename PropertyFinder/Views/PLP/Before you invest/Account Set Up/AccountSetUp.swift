////
////  AccountSetUp.swift
////  PropertyFinder
////
////  Created by Anand Narayan Rai on 22/05/26.

import SwiftUI

struct OnboardingCardRow: View {
    let stepNumber: String
    let stepTitle: String
    let stepIndex: Int
    let currentStep: Int
    
    var body: some View{
        HStack(spacing: 12){
            VStack(alignment:.leading, spacing: 4){
                Text(stepNumber)
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.secondaryText)
                Text(stepTitle)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.primaryText)
            }
            
            Spacer()
            
            if currentStep > stepIndex {
                HStack(spacing: 4){
                    Image(systemName: "checkmark")
                    Text("Done")
                        .font(.footnote)
                        .fontWeight(.regular)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.green.opacity(0.3))
                .clipShape(Capsule())
                
            } else if currentStep == stepIndex {
                HStack(spacing: 4){
                    Image(systemName: "clock")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    Text("In progress")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.theme.feedbackColor)
                .clipShape(Capsule())
                
            } else {
                HStack(spacing: 4){
                    Image(systemName: "clock")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    Text("2 min")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.theme.backgroundBanner.opacity(0.5))
                .clipShape(Capsule())
            }
            
        }
        .padding(16)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
    }
}

enum OnboardingStep: Int, Identifiable {
    case accountCreated = 1
    case employmentDetails = 2
    case identityVerification = 3
    case addressVerification = 4
    case completed = 5
    
    var id: Int { rawValue }
}


struct AccountSetUp: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var currentCompletedStep = 2
    @State private var activeStep : OnboardingStep = .accountCreated
    @State private var shouldNavigate = false
    @State private var showBanner = true
    
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Button(action: { dismiss() }){
                    Image(systemName: "arrow.backward")
                        .foregroundColor(Color.theme.black)
                }
                Spacer()
                HStack{
                    Text("Account set up")
                        .font(.title3).bold()
                        .foregroundColor(Color.theme.primaryText)
                }
                Spacer()
                Image(systemName: "arrow.backward")
                       .opacity(0)
            }
            .padding(16)
            
            VStack(spacing:24){
                
                SegmentedProgressBar(totalSteps: 4 ,currentStep: currentCompletedStep)
                
                if showBanner{
                    HStack(spacing: 8){
                        HStack(spacing: 12){
                            Image("Warning")
                            
                            (
                                Text("Regulations")
                                    .underline()
                                    .foregroundColor(Color.theme.primaryBlue)
                                +
                                
                                Text(" require us to verify your information before you can invest.")
                                
                                    .foregroundColor(Color.theme.primaryText)
                            )
                            .font(.footnote)
                            .fontWeight(.regular)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {showBanner = false}){
                            Image(systemName: "xmark")
                                .foregroundColor(Color.theme.primaryText)
                                .font(.footnote)
                            
                        }
                    }
                    .padding(16)
                    .background(Color.theme.backgroundBanner.opacity(0.5))
                    .cornerRadius(12)
                }
                
                VStack(spacing: 16){
                    
                    OnboardingCardRow(stepNumber: "Step 1", stepTitle: "Account created", stepIndex: 1, currentStep: currentCompletedStep)
                    
                    OnboardingCardRow(stepNumber: "Step 2", stepTitle: "Employment details", stepIndex: 2, currentStep: currentCompletedStep)
                    
                    OnboardingCardRow(stepNumber: "Step 3", stepTitle: "Verify your identity", stepIndex: 3, currentStep: currentCompletedStep)
                    
                    OnboardingCardRow(stepNumber: "Step 4", stepTitle: "Verify your Address", stepIndex: 4, currentStep: currentCompletedStep)
                }
            }
            .padding(16)
            
            Spacer()
            
            VStack(spacing: 16){
                ActionButton(title: "Continue", isPrimary: true, action: {
                    handleContinueClick()
                })
                
                ActionButton(title: "I'll do this later", isPrimary: false, action: {})
            }
            .padding(16)
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $shouldNavigate) {
            destinationView(for: activeStep)
        }
    }
}

extension AccountSetUp{
    private func handleContinueClick(){
        if let currentStep = OnboardingStep(rawValue: currentCompletedStep) {
            activeStep = currentStep
            shouldNavigate = true
        }
    }
    
    @ViewBuilder
    private func destinationView(for step: OnboardingStep) -> some View {
        switch step {
        case .accountCreated:
                EmptyView()
            
        case .employmentDetails:
            EmploymentDetails(currentCompletedStep: $currentCompletedStep, activeStep: $activeStep)
            
        case .identityVerification:
            UploadYourPassport(currentCompletedStep: $currentCompletedStep, activeStep: $activeStep)
            
        case .addressVerification:
            VerifyYourAddress(currentCompletedStep: $currentCompletedStep, activeStep: $activeStep)
            
        case .completed:
                ConfirmInvestment()
        }
    }
}

struct AccountSetUp_Previews: PreviewProvider {
    static var previews: some View {
        AccountSetUp()
    }
}


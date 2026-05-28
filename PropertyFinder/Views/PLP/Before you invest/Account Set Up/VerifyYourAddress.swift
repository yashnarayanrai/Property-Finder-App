//
//  VerifyYourAddress.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 28/05/26.
//

import SwiftUI

struct VerifyYourAddress: View {
    @State private var showInfoSheet = false
    @State private var showUploadSheet = false
    
    @State private var currentQuestion: Int = 1
    @State private var quizAnswers: [Int : String] = [:]
    
    @Binding var currentCompletedStep: Int
    @Binding var activeStep: OnboardingStep
    
    @Environment(\.dismiss) var dismiss
    
    let questionsData: [Int : (title: String, subtitle: String, options: [String])] = [
        
        1: (
            title: "What is your current residential situation?",
            subtitle: "This is required by financial regulators. Please select the option most relevant to you.",
            options: [
                "Home Owner",
                "Registered tenant of a property",
                "Long-stay hotel apartment (3+months)",
                "Shared accommodation (not the tenant)",
                "Sponsored campany residence",
                "Other"
            ]
        ),
        
        2: (
            title: "Upload your proof of address",
            subtitle: "Please select a document type that we can use to verify you.",
            options: [
                "Bank or credit card statement",
                "Title deed",
                "Utilities or telecom bill"
            ]
        )
    ]
    
    private let documentCriteria: [String] = [
        "Full legal name is clear and visible",
        "Full address is clear and visible",
        "Document dated within the last 3 months",
    ]
    
    
    // MARK: - Current Question
    
    var currentData: (title: String, subtitle: String, options: [String]) {
        questionsData[currentQuestion] ?? questionsData[1]!
    }
    
    var body: some View {
        VStack {
            headerSection
            
            VStack(spacing: 24){
                SegmentedProgressBar(totalSteps: 2, currentStep: 2)
                
                if currentQuestion <= 2 {
                    optionQuestionView
                } else {
                    uploadSection
                }
            }
            
            Spacer()
            
            
        }
        .padding(16)
        .navigationBarBackButtonHidden(true)
        
        .sheet(isPresented: $showInfoSheet){
            VStack{
                VStack(spacing: 10){
                    HStack(alignment: .top){
                        Text("Why do we need to verify your address?")
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
                    Text("We use your address details to confirm where you live and meet KYC and AML requirements set by the Dubai Financial Services Authority.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(16)
                Spacer(minLength: 0)
            }
            .foregroundColor(Color.theme.primaryText)
            .presentationDetents([.height(200)])
        }
        
        
        .sheet(isPresented: $showUploadSheet){
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 10){
                    HStack(alignment: .top){
                        Text("Upload file")
                            .font(.title3).bold()
                        
                        Spacer()
                        
                        Button(action: { showUploadSheet = false }){
                            Image(systemName: "xmark")
                                .font(.title3)
                                .fontWeight(.regular)
                        }
                    }
                }
                .padding(16)
                
                Divider()
                
                VStack{
                    VStack(alignment: .leading, spacing: 3){
                        HStack(spacing: 8){
                            Image(systemName: "photo")
                            Text("Photos")
                                .font(.body)
                                .fontWeight(.regular)
                        }
                        .padding(12)
                        
                        HStack(spacing: 8){
                            Image(systemName: "camera")
                            Text("Camera")
                        }
                        .padding(12)
                        
                        HStack(spacing: 8){
                            Image(systemName: "document")
                            Text("File")
                        }
                        .padding(12)
                        
                        HStack(spacing: 8){
                            Image(systemName: "folder")
                            Text("Drive")
                        }
                        .padding(12)
                    }
                }
                .padding(.horizontal,16)
                .padding(.vertical, 24)
                
                Spacer(minLength: 0)
            }
            .foregroundColor(Color.theme.primaryText)
            .presentationDetents([.height(300)])
        }
    }
}

extension VerifyYourAddress {
    
    private var headerSection: some View {
        
        HStack(spacing: 16) {
            
            Button(action: {
                //                handleBackNavigation()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.theme.black)
            }
            
            Spacer()
            
            Text("Verify your address")
                .font(.title3.bold())
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .opacity(0)
        }
        .padding(.vertical, 16)
    }
    
    private var uploadSection: some View {
        VStack(alignment: .leading, spacing: 24){
            VStack(alignment: .leading, spacing: 12){
                Text("Upload your proof of address")
                    .font(.title3).bold()
                
                Text("Please ensure the document meets the following criteria:")
                    .font(.callout)
                    .fontWeight(.regular)
                
                criteriaSection
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text("Document example")
                    .font(.subheadline).bold()
                
                Button(action: {  }){
                    Color(.systemGray4)
                        .frame(maxWidth: 300, maxHeight: 300)
                }
                
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
            
            ActionButton(title: "Upload", isPrimary: true, action: { showUploadSheet = true })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color.theme.primaryText)
    }
    
    private var confirmAddress: some View {
        VStack(spacing: 16){
            Text("Confirm address document")
                .font(.title3).bold()
            
            VStack(alignment: .leading, spacing: 12){
                Text("Uploaded document")
                    .font(.subheadline).bold()
                Text("propertyFinder.PDF")
                
                Button(action: {  }){
                    Color(.systemGray4)
                        .frame(maxWidth: 300, maxHeight: 300)
                }
                
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
            
            VStack(spacing: 12){
                Text("By submitting, you agree that:")
                    .font(.subheadline).bold()
                criteriaSection
            }
            
            ActionButton(title: "Submit", isPrimary: true, action: {})
        }
    }
    
    private var criteriaSection: some View {
        VStack(alignment: .leading, spacing: 16){
            
            VStack(spacing: 16){
                ForEach(documentCriteria, id: \.self){ criteria in
                    criteriaRow(text: criteria)
                }
            }
            
        }
        .padding(16)
        .foregroundColor(Color.theme.primaryText)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private func criteriaRow(text: String) -> some View {
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

extension VerifyYourAddress {
    private func optionButton(_ option: String) -> some View {
        
        let isSelected = quizAnswers[currentQuestion] == option
        
        return Button(action: {
            handleOptionSelection(option: option)
        }) {
            
            Text(option)
                .font(.body)
                .foregroundColor(
                    isSelected
                    ? Color.theme.primaryBlue
                    : Color.theme.primaryText
                )
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    isSelected
                    ? Color.theme.primaryBlue.opacity(0.5)
                    : Color.clear
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            isSelected
                            ? Color.theme.primaryBlue
                            : Color.theme.gray.opacity(0.3),
                            lineWidth: 1
                        )
                )
                .cornerRadius(12)
        }
    }
    
    private var optionQuestionView: some View {
        
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(currentData.title)
                    .font(.title3.bold())
                
                Text(currentData.subtitle)
                    .font(.callout)
                    .foregroundColor(Color.theme.secondaryText)
            }
            
            VStack(spacing: 16) {
                
                ForEach(currentData.options, id: \.self) { option in
                    optionButton(option)
                }
            }
        }
        
    }
    
    
    private func handleOptionSelection(option: String) {
        
        quizAnswers[currentQuestion] = option
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            if currentQuestion < 2 {
                
                currentQuestion += 1
                
            } else {
                
                currentQuestion = 3
            }
        }
    }
}

struct VerifyYourAddress_Previews: PreviewProvider {
    static var previews: some View {
        VerifyYourAddress(currentCompletedStep: .constant(2), activeStep: .constant(.addressVerification))
    }
}

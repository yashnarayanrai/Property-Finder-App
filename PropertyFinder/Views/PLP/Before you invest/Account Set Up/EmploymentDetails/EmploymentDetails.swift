import SwiftUI

struct EmploymentDetails: View {
    
    @Binding var currentCompletedStep: Int
    @Binding var activeStep: OnboardingStep
    
    @State private var currentQuestion: Int = 1
    @State private var quizAnswers: [Int : String] = [:]
    
    @State private var selectedIndustry = ""
    @State private var selectedRole = ""
    
    @State private var country = ""
    @State private var streetAddress = ""
    @State private var apartment = ""
    @State private var city = ""
    @State private var postalCode = ""
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Questions Data
    
    let questionsData: [Int : (title: String, subtitle: String, options: [String])] = [
        
        1: (
            title: "What's your main source of funds?",
            subtitle: "We need your details to ensure your account is secure and compliant.",
            options: [
                "Salary",
                "Personal savings",
                "Business income",
                "Investment income",
                "Inheritance"
            ]
        ),
        
        2: (
            title: "How much do you plan to invest in the next 12 months?",
            subtitle: "This is required for regulatory purposes. Your actual investment can be higher or lower.",
            options: [
                "Less than 10,000 AED",
                "10,000 AED - 30,000 AED",
                "30,000 AED - 100,000 AED",
                "100,000 AED - 300,000 AED",
                "Over 300,000 AED"
            ]
        ),
        
        3: (
            title: "Tell us about your employment",
            subtitle: "We need this information to open your account in line with regulations.",
            options: [
                "Student",
                "Employed",
                "Self-employed",
                "Homemaker",
                "Retired"
            ]
        )
    ]
    
    
    // MARK: - Current Question
    
    var currentData: (title: String, subtitle: String, options: [String]) {
        questionsData[currentQuestion] ?? questionsData[1]!
    }
    
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            headerSection
            
            VStack(spacing: 24){
                progressSection
                
                questionSection
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: - UI Sections

extension EmploymentDetails {
    
    private var headerSection: some View {
        
        HStack(spacing: 16) {
            
            Button(action: {
                handleBackNavigation()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.theme.black)
            }
            
            Spacer()
            
            Text("Employment details")
                .font(.title3.bold())
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .opacity(0)
        }
        .padding(.vertical, 16)
    }
    
    
    private var progressSection: some View {
        
        SegmentedProgressBar(
            totalSteps: 5,
            currentStep: currentQuestion
        )
    }
    
    
    private var questionSection: some View {
        
        VStack(alignment: .leading, spacing: 24) {
            
            if currentQuestion <= 3 {
                optionQuestionView
                
            } else if currentQuestion == 4 {
                workDetailsView
                
                Spacer()
                
                HStack(spacing: 12){
                    Image("ShieldIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    Text("We will never contact your employer or share your details with them.")
                        .font(.footnote)
                        .fontWeight(.regular)
                }
                .padding(12)
                .background(Color.theme.backgroundBanner.opacity(0.5))
                .cornerRadius(12)
                
                ActionButton(title: "Continue", isPrimary: true, action: { currentQuestion = 5
                    
                })
                
            } else if currentQuestion == 5 {
                employerAddressView
                
                ActionButton(title: "Continue", isPrimary: true, action: {
                    currentCompletedStep = 3
                        dismiss()
                })
            }
            
        }
    }
    
    
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
}

// MARK: - Actions

extension EmploymentDetails {
    
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
    
    private var workDetailsView: some View {
        
        VStack{
            VStack(alignment: .leading, spacing: 24){
                                
                VStack(alignment: .leading, spacing: 16){
                    Text("Tell us about your work")
                        .font(.title3).bold()
                    Text("Select your industry and enter your job title to help us understand your role.")
                }
                
                VStack(alignment: .leading, spacing: 16){
                    Text("Employment industry")
                    HStack{
                        Text("Financial service")
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    
                    
                    Text("Select your role")
                    HStack{
                        Text("Financial service")
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                }
                
            }
            .padding(.vertical, 8)
            .foregroundColor(Color.theme.primaryText)
            
        }
    }
    
    private var employerAddressView: some View {
        VStack{
            VStack(alignment: .leading, spacing: 24){
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Employer's address")
                        .font(.title3).bold()
                    Text("Please confirm your employer's address to ensure we have accurate information.")
                        .font(.callout)
                        .fontWeight(.regular)
                }
                
                VStack(alignment: .leading, spacing: 16){
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Country")
                            .font(.subheadline).bold()
                        
                        TextField("🇦🇪 United Arab Emirates", text: $country)
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
                        
                        TextField("E.g Unit 001", text: $apartment)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("City")
                            .font(.subheadline).bold()
                        
                        TextField("E.g Dubai", text: $city)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Postal Code")
                            .font(.subheadline).bold()
                        
                        TextField("E.g 000000", text: $postalCode)
                            .padding()
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3),lineWidth: 1))
                    }
                    
                }
                
                
            }
            .padding(.vertical, 8)
            .foregroundColor(Color.theme.primaryText)
        }
    }
}


// MARK: - Actions

extension EmploymentDetails {
    
    private func handleOptionSelection(option: String) {
        
        // Save Answer
        quizAnswers[currentQuestion] = option
        
        
        // Small Delay For Selection Animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            // Next Question
            if currentQuestion < 5 {
                
                currentQuestion += 1
                
            } else {
                
                // Step Completed
                currentCompletedStep = 3
                
                dismiss()
            }
        }
    }
    
    
    private func handleBackNavigation() {
        
        if currentQuestion > 1 {
            
            currentQuestion -= 1
            
        } else {
            
            dismiss()
        }
    }
}



// MARK: - Preview

struct EmploymentDetails_Previews: PreviewProvider {
    
    static var previews: some View {
        
        EmploymentDetails(
            currentCompletedStep: .constant(2),
            activeStep: .constant(.employmentDetails)
        )
    }
}

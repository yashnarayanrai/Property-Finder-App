//
//  ConfirmInvestment.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 01/06/26.
//

import SwiftUI

struct ConfirmInvestment: View {
    @State private var initialInvestment: Int = 500
    @State private var showLearnMoreSheet = false
    @State private var toContinuePayment = false
    @State private var isAgree = false
    
    @Environment(\.dismiss) var dismiss
    
    var annualIncome: Int { Int(Double(initialInvestment) * 0.485)}
    var appreciation: Int { Int(Double(initialInvestment) * 1.36)}
    
    var body: some View {
        VStack(spacing: 0){
            headerSection
            
            ScrollView(showsIndicators: false){
                detailSection
            }
            
            buttonSection
        }
        .sheet(isPresented: $toContinuePayment){
            ContinueToPayment
                .presentationDetents([.height(250)])
                .interactiveDismissDisabled()
                .presentationDragIndicator(.hidden)
        }
        
        .navigationDestination(isPresented: $isAgree){
            Payment()
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension ConfirmInvestment {
    private var headerSection: some View {
        
        HStack{
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.theme.black)
            }
            
            Spacer()
            
            Text("Confirm Investment")
                .font(.title3.bold())
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .opacity(0)
        }
        .padding(16)
    }
    
    private var buttonSection: some View {
        VStack(spacing: 16){
            ActionButton(title: "Continue to payment", isPrimary: true, action: { toContinuePayment = true })
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
    }
    
    private var detailSection: some View {
        VStack(spacing: 16){
            
            VStack(alignment: .leading){
                Image("propertyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 200)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 12){
                    Text("Arjan, Dubai south")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    Text("3 bed in Dubai South Tower 1")
                        .font(.body).bold()
                }
                .padding(16)
                .foregroundColor(Color.theme.primaryText)
                
                Divider()
                
                HStack(spacing: 12){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Annual Income")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.secondaryText)
                            
                            Spacer()
                            
                            Image("InfoCircle")
                        }
                        Text("\(annualIncome) AED")
                    }
                    
//                    Rectangle()
//                        .fill(Color.theme.gray.opacity(0.3))
//                        .frame(width: 1)
                    
                    Divider()
                        .frame(width: 1)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Appreciation")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.secondaryText)
                            
                            Spacer()
                            
                            Image("InfoCircle")
                        }
                        Text("\(appreciation) AED")
                    }
                }
                .padding(16)
            }
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            
            VStack(alignment: .leading, spacing: 12){
                Text("Initial investment")
                
                HStack(spacing: 8){
                    Button(action: {if initialInvestment > 500 { initialInvestment -= 500 }}){
                        Image(systemName: "minus")
                            .font(.subheadline).bold()
                            .foregroundColor(Color.theme.black)
                            .frame(width: 48, height: 48)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    }
                    
                    
                    Text("\(initialInvestment.formatted()) AED")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.black)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    
                    Button(action: { initialInvestment += 500
                    }){
                        Image(systemName: "plus")
                            .font(.subheadline).bold()
                            .foregroundColor(Color.theme.black)
                            .frame(width: 48, height: 48)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    }
                }
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            
            // Mark: - Banner
            HStack(spacing: 12){
                Image("Bank")
                
                (
                    Text("This is a 5-year investment, with flexible exit windows twice a year. ")
                        .foregroundColor(Color.theme.primaryText)
                        .font(.footnote)
                        .fontWeight(.regular)
                    +
                    Text("Learn more")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.primaryBlue)
                    //                        .onTapGesture {
                    //                            showLearnMoreSheet = true
                    //                        }
                )
                
            }
            .padding(12)
            .background(Color.theme.backgroundBanner.opacity(0.5))
            .cornerRadius(12)
        }
        .padding(16)
    }
}

extension ConfirmInvestment {
    private var ContinueToPayment: some View {
        VStack(alignment: .leading){
            HStack(spacing: 10){
                Text("Terms and conditions")
                    .font(.title3).bold()
                Spacer()
                Button(action: { toContinuePayment = false }){
                    Image(systemName: "xmark")
                        .font(.title3)
                }
            }
            .foregroundColor(Color.theme.primaryText)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 24){
                (
                    Text("By continuing with your investment, you agree with Stake's ")
                    +
                    Text("terms and conditions,")
                        .underline()
                        .foregroundColor(Color.theme.primaryBlue)
                    +
                    Text("key risks")
                        .underline()
                        .foregroundColor(Color.theme.primaryBlue)
                    +
                    Text(" and ")
                    +
                    Text("payment terms.")
                        .underline()
                        .foregroundColor(Color.theme.primaryBlue)
                )
                
                ActionButton(title: "I agree", isPrimary: true, action: {
                    toContinuePayment = false
                    
                    isAgree = true
                    
                })
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.theme.backgroundBanner)
        
    }
}

struct ConfirmInvestment_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmInvestment()
    }
}

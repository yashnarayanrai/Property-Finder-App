//
//  InvestmentCalculatorComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct InvestmentCalculatorComponent: View {
    @State private var initialInvestment: Int = 500
    
    var projectedValue: Int { Int(Double(initialInvestment) * 1.767)}
    var annualIncome: Int { Int(Double(initialInvestment) * 0.485)}
    var appreciation: Int { Int(Double(initialInvestment) * 1.36)}
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 16){
            Text("Investment Calculator")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.black)
            
            VStack{
                VStack(alignment: .leading, spacing: 12){
                    Text("Projected investment value in 5 years")
                        .foregroundColor(Color.theme.gray)
                    
                    HStack{
                        Text("\(projectedValue) ACD")
                            .font(.body).bold()
                        
                        Text("+22%")
                            .font(.callout)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.3))
                            .clipShape(Capsule())
                    }
                }
                .padding(16)
                
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
                    
                    Rectangle()
                        .fill(Color.theme.gray.opacity(0.3))
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
                    
                    
                    Text("\(initialInvestment) AED")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.black)
                        .frame(maxWidth: .infinity, maxHeight: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    
                    Button(action: { if initialInvestment < 50000 {
                        initialInvestment += 500
                    }}
                    ){
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
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct InvestmentCalculatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentCalculatorComponent()
    }
}

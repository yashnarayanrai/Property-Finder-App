//
//  CalculatorView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatedViewModel()
    
    var body: some View {
        VStack(spacing: 16){
            VStack(alignment: .leading, spacing: 8){
                Text("How your money could grow")
                    .font(.title3).bold()
                
                Text("Calculations assume monthly deposite, rental income investment, and projected appreciation.")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            monthlyDeposite
            
            monthlyDepositeValues
            
            graphView
            
        }
        .padding(.horizontal, 16)
        .foregroundColor(Color.theme.primaryText)
        .background(Color(UIColor.systemBackground))
    }
}

extension CalculatorView {
    
    private var monthlyDeposite: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Monthly deposits")
                .font(.subheadline)
                .fontWeight(.regular)
            
            HStack(spacing: 8){
                Button(action: {
                    viewModel.decreaseDepositValue()
                }){
                    Image(systemName: "minus")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryBlue)
                        .frame(width: 48, height: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.primaryBlue, lineWidth: 1))
                }
                
                
                Text("\(viewModel.monthlyDeposit) AED")
                    .font(.subheadline).bold()
                    .foregroundColor(Color.theme.black)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color.theme.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
                Button(action: { viewModel.increaseDepositValue()
                    
                }){
                    Image(systemName: "plus")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryBlue)
                        .frame(width: 48, height: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.primaryBlue, lineWidth: 1))
                }
            }
        }
        .padding(16)
        .background(Color.theme.backgroundBanner)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
    
    private var monthlyDepositeValues: some View {
        VStack{
            HStack{
                Text("Proj. portfolio value in Y15")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                Spacer()
                
                Text("\(viewModel.projectedValue) AED")
                    .font(.subheadline).bold()
            }
            .padding(8)
            
            Divider()
            
            HStack{
                Text("Monthly income by Y15")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                Spacer()
                
                Text("\(viewModel.monthlyIncome) AED")
                    .font(.subheadline).bold()
            }
            .padding(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
    
    private var graphView: some View {
        
        VStack(alignment: .leading){
            VStack{
                VStack(spacing: 16){
                    HStack(spacing: 8){
                        HStack(spacing: 8){
                            Image(systemName: "circle.fill")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryBlue)
                            Text("Projection")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.1))
                        .clipShape(Capsule())
                        
                        HStack(spacing: 8){
                            Image(systemName: "circle.fill")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryBlue.opacity(0.5))
                            Text("Likely range")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.1))
                        .clipShape(Capsule())
                    }
                }
            }
            .padding(16)

            
            Divider()
            
            VStack{
                Text("Estimates shown are illustrative only and not a guarantee of future performance.")
            }
            .padding(16)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

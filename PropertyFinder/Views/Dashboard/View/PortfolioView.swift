//
//  PortfolioView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import SwiftUI

struct PortfolioView: View {
    
    let portfolio: PortfolioModel
    
    var body: some View {
        VStack(spacing: 16){
            portfolioContent
            
            myInvestmentContent
        }
        .foregroundColor(Color.theme.primaryText)
    }
}

extension PortfolioView {
    private var portfolioContent: some View {
        VStack(spacing: 12){
            HStack{
                VStack(spacing: 8){
                    Text("Total Balance")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    Text(portfolio.totalBalance)
                        .font(.title3).bold()
                }
            }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .background(Color.theme.backgroundBanner)
            .cornerRadius(12)
            
            
            VStack(spacing: 16){
                HStack{
                    Text("Cash Balance")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    Text(portfolio.cashBalance)
                        .font(.subheadline).bold()
                }
                
                HStack{
                    Text("Rewards Balance")
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    Text(portfolio.rewardsBalance)
                        .font(.subheadline).bold()
                }
            }
        }
    }
    
    private var myInvestmentContent: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("My Investments")
                .font(.title3).bold()
            
            ForEach(portfolio.investments) { investment in
                HStack(spacing: 12){
                    
                    Color.black.opacity(0.1).frame(width: 73, height: 73)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(investment.investedAmount)
                            .font(.title3).bold()
                        
                        Text(investment.title)
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                        Text(investment.location)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            }
            
        }
    }
}


struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView(
            portfolio: PortfolioModel(
                totalBalance: "5,000 AED",
                cashBalance: "1,000 AED",
                rewardsBalance: "80 AED",
                investments: [
                    InvestmentModel(
                        title: "3 Bed in Diamond Tower",
                        location: "Mohamed Bin Rashid City",
                        investedAmount: "5,000 AED",
                        imageName: "propertyImage"
                    )
                ]
            )
        )
    }
}

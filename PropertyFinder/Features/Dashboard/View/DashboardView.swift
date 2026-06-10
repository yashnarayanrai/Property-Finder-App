//
//  PortfolioView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel = DashboardViewModel()
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0){
            AppHeaderView(title: "Fractional Investment", backAction: { dismiss() })
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 16){
                    
                    selectOption
                    
                    switch viewModel.selectedTab {
                        
                    case .portfolio:
                        PortfolioView(
                            portfolio: viewModel.portfolio
                        )
                    case .calculator:
                        CalculatorView()
                    }

                    buildingContent
                    
                    accessFullPortfolio
                }
                .padding(16)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

extension DashboardView {
    
    private var selectOption: some View {
        
        VStack(alignment: .leading, spacing: 24){
            HStack(spacing: 12){
                CapsuleButton(title: "Portfolio", action: { viewModel.selectTab(.portfolio) })
                
                CapsuleButton(title: "Calculator", action: { viewModel.selectTab(.calculator) })
            }
        }
        .foregroundColor(Color.theme.primaryText)
        
    }
    
    private var buildingContent: some View {
        
        VStack(spacing: 24){
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading, spacing: 4){
                    Text("Start building towards your potential")
                        .font(.title3).bold()
                    
                    Text("Browse available investment opportunities.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                
                HStack(spacing: 12){
                    Image("SheildIcon2")
                    
                    Text("DFSA-regulated Dubai property investing with secure, encrypted payments.")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.black)
                }
                .padding(12)
                .background(Color.theme.backgroundBanner)
                .cornerRadius(12)
                
                ActionButton(title: "View investment opportunities", isPrimary: true, action: {})
            }
        }
        .foregroundColor(Color.theme.primaryText)
        
    }
    
    private var accessFullPortfolio: some View {
        
        HStack(spacing: 4){
            Text("Access full portfolio on Stake")
            
            Image(systemName: "arrow.up.right.square")
        }
        .font(.body).bold()
        .foregroundColor(Color.theme.primaryBlue)
        .frame(maxWidth: .infinity)
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

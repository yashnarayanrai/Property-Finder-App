//
//  DashboardViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation

enum DashboardTap {
    case portfolio
    case calculator
}

final class DashboardViewModel: ObservableObject {
    @Published var selectedTab: DashboardTap = .portfolio
    
    @Published var portfolio: PortfolioModel
    
    init() {
        self.portfolio = PortfolioModel(totalBalance: "0.00 AED", cashBalance: "0.00 AED", rewardsBalance: "0.00 AED", investments: [InvestmentModel(title: "3 Bed in Diamond Tower", location: "duabi", investedAmount: "5,000 AED", imageName: "propertyImage")])
    }
    
    func showPortfolio() {
        selectedTab = .portfolio
    }
    
    func showCalculator() {
        selectedTab = .calculator
    }
}

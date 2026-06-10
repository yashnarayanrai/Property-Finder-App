//
//  DashboardViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation

enum DashboardTab: String, CaseIterable {
    case portfolio = "Portfolio"
    case calculator = "Calculator"
}

final class DashboardViewModel: ObservableObject {
    @Published var selectedTab: DashboardTab = .portfolio
    
    @Published var portfolio: PortfolioModel
    
    init() {
        self.portfolio = PortfolioModel(totalBalance: "0.00 AED", cashBalance: "0.00 AED", rewardsBalance: "0.00 AED", investments: [InvestmentModel(title: "3 Bed in Diamond Tower", location: "duabi", investedAmount: "5,000 AED", imageName: "propertyImage")])
    }
    
    func selectTab(_ tab: DashboardTab){
        selectedTab = tab
    }
}

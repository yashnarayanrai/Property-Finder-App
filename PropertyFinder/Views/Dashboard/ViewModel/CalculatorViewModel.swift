//
//  CalculatorViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation

final class CalculatedViewModel: ObservableObject {
    @Published var monthlyDeposit = 2000
    
    var projectedValue: Int { Int(Double(monthlyDeposit) * 1.767)}
    var monthlyIncome: Int { Int(Double(monthlyDeposit) * 0.485)}
    var appreciation: Int { Int(Double(monthlyDeposit) * 1.36)}
    
    func increaseDepositValue() {
        guard monthlyDeposit < 50000 else { return }
        
        monthlyDeposit += 500
    }
    
    func decreaseDepositValue() {
        guard monthlyDeposit > 500 else { return }
        
        monthlyDeposit -= 500
    }
}

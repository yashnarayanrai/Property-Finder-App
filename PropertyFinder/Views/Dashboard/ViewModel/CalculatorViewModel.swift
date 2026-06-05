//
//  CalculatorViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation


final class CalculatedViewModel: ObservableObject {
    @Published var monthlyDeposit = 2000
    
    let chartData: [ProjectionData] = [
        .init(year: 1, value: 20000, lowerRange: 22000, upparRange: 26000),
        .init(year: 5, value: 40000, lowerRange: 38000, upparRange: 47000),
        .init(year: 10, value: 60000, lowerRange: 52000, upparRange: 70000),
        .init(year: 15, value: 78000, lowerRange: 68000, upparRange: 92000)
    ]
    
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

//
//  CalculatorModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation

struct CalculatorModel {
    
    var monthlyDeposite: Int
    var monthlyIncome: Int
    var projectedValue: Int
    var appreciation: Int
}

struct ProjectionData: Identifiable {
    let id = UUID()
    let year: Int
    let value: Int
    let lowerRange: Double
    let upparRange: Double
}

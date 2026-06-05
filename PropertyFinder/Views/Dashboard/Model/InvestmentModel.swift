//
//  InvestmentModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import Foundation

struct InvestmentModel: Identifiable {
    let id = UUID()
    
    let title: String
    let location: String
    let investedAmount: String
    let imageName: String
}

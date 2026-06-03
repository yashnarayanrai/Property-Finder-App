//
//  ReceiptViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import Foundation

final class ReceiptViewModel: ObservableObject {
    
    @Published var viewPortfolio = false
    @Published var goToSearch = false
    
    let amountPaid: String
    let cashBackEarned: String
    let referenceNumber: String
    let paymentMethod: String
    
    init(
        amountPaid: String = "5,000 AED",
        cashBackEarned: String = "80 AED",
        referenceNumber: String = "000085752267",
        paymentMethod: String = "Apple Pay"
    ) {
        self.amountPaid = amountPaid
        self.cashBackEarned = cashBackEarned
        self.referenceNumber = referenceNumber
        self.paymentMethod = paymentMethod
    }
    
    func didTapViewPortfolio() {
        viewPortfolio = true
    }
    
    func didTapGoToSearch() {
        goToSearch = true
    }
}

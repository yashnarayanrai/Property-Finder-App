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
    
    let receipt: ReceiptModel
    
    init(
        
        receipt: ReceiptModel = ReceiptModel (
            amountPaid: "5,000 AED",
            cashBackEarned: "80 AED",
            referenceNumber: "000085752267",
            paymentMethod: "Apple Pay"
        )
    ) {
        self.receipt = receipt
    }
    
    func didTapViewPortfolio() {
        viewPortfolio = true
    }
    
    func didTapGoToSearch() {
        goToSearch = true
    }
}

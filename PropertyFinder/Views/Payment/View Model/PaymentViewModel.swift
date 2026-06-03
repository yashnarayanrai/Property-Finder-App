//
//  PaymentViewModel.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import Foundation

final class PaymentViewModel: ObservableObject {
    
    @Published var cardNumber = ""
    @Published var expiryDate = ""
    @Published var cvv = ""
    
    @Published var hasCard = false
    
    @Published var savedCard: Card?
    
    @Published var selectedPayment: PaymentMethod = .card
    
    @Published var showDebitCardSheet = false
    @Published var isPay = false
    
    
    private let addCardUseCase: AddCardUseCaseProtocol
    
    init(
        addCardUseCase: AddCardUseCaseProtocol = AddCardUseCase()
    ){
        self.addCardUseCase = addCardUseCase
    }
    
    func addCard() {
        guard let card = addCardUseCase.execute(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cvv: cvv
        ) else {
            return
        }
        
        savedCard = card
        
        hasCard = true
        
        showDebitCardSheet = false
        
        clearField()
    }
    
    private func clearField() {
        cardNumber = ""
        expiryDate = ""
        cvv = ""
    }
    
    var isAddCardEnabled: Bool {
        !cardNumber.isEmpty &&
        !expiryDate.isEmpty &&
        !cvv.isEmpty
    }
    
    var maskedCardNumber: String {
        savedCard?.number.suffix(4).description ?? ""
    }
    
    func didTapToIsPay() {
        isPay = true
    }
}

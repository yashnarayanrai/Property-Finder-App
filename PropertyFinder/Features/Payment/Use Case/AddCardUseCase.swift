//
//  AddCardUseCase.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import Foundation

protocol AddCardUseCaseProtocol {
    func execute(
        cardNumber: String,
        expiryDate: String,
        cvv: String
    ) -> Card?
}

final class AddCardUseCase: AddCardUseCaseProtocol {
    func execute(
        cardNumber: String,
        expiryDate: String,
        cvv: String
    ) -> Card? {
        guard !cardNumber.isEmpty,
              !expiryDate.isEmpty,
              !cvv.isEmpty
        else{
            return nil
        }
        
        return Card(number: cardNumber, expiryDate: expiryDate)
    }
}

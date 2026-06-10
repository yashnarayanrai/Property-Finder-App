//
//  PaymentMethod.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import Foundation

enum PaymentMethod {
    case card
    case applePay
    case bank
}

struct Card {
    let number: String
    let expiryDate: String
}


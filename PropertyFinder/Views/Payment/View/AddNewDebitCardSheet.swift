//
//  AddNewDebitCard.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import SwiftUI

struct AddNewDebitCardSheet: View {
    @StateObject private var viewModel = PaymentViewModel()
    
    var body: some View {
        
        VStack(spacing: 16){
            HStack(spacing: 10){
                Text("Add new card")
                    .font(.title3).bold()
                Spacer()
                Button(action: { viewModel.showDebitCardSheet = false }){
                    Image(systemName: "xmark")
                        .font(.title3)
                }
            }
            
            
            VStack(spacing: 16){
                HStack(spacing: 12){
                    Image("SheildIcon2")
                    
                    Text("Stake is a DFSA-regulated Dubai property investing with secure, encrypted payments.")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.white)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(12)
                .background(Color.theme.secondaryBlue)
                .cornerRadius(12)
                
                
                VStack(spacing: 16){
                    VStack(alignment: .leading){
                        Text("Card number")
                            .font(.body).bold()
                        
                        TextField("0000 0000 0000 0000", text: $viewModel.cardNumber)
                            .padding(12)
                            .keyboardType(.numberPad)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    }
                }
                
                HStack(spacing: 16){
                    VStack(alignment: .leading, spacing: 8){
                        Text("Expiry date")
                            .font(.body).bold()
                        
                        TextField("MM/YY", text: $viewModel.expiryDate)
                            .padding(12)
                            .keyboardType(.numberPad)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    }
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("CVV")
                            .font(.body).bold()
                        
                        TextField("CVV", text: $viewModel.cvv)
                            .padding(12)
                            .keyboardType(.numberPad)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    }
                }
            }
            
            
            ActionButton(title: "Add card", isPrimary: true, action: {
                viewModel.addCard()
            })
            .padding(.vertical, 16)
            .disabled(!viewModel.isAddCardEnabled)
        }
        .padding(16)
        .foregroundColor(Color.theme.primaryText)
    }
}

struct AddNewDebitCardSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddNewDebitCardSheet()
    }
}

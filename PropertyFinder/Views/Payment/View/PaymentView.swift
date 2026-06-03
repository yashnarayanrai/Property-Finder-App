//
//  Payment.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 01/06/26.
//

import SwiftUI


struct Payment: View {
    @StateObject private var viewModel = PaymentViewModel()
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            AppHeaderView(title: "Select payment method", backAction: { dismiss() })
            
            paymentMethodView
            
            Spacer()
       
            ActionButton(title: "Pay 500 AED", isPrimary: true, action: { viewModel.didTapToIsPay() })
                .padding(24)
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $viewModel.isPay){
            ReceiptView()
        }
        .sheet(isPresented: $viewModel.showDebitCardSheet){
            AddNewDebitCardSheet()
                .presentationDetents([.height(500)])
                .interactiveDismissDisabled()
        }
    }
}

extension Payment {
    private var paymentMethodView: some View{
        VStack(spacing: 24){
            VStack(alignment: .leading, spacing: 24){
                VStack(alignment: .leading, spacing: 12){
                    Text("Debit cards")
                        .font(.subheadline).bold()
                    
                    if viewModel.hasCard {
                        HStack(spacing: 8){
                            Text("Visa •••• \(viewModel.maskedCardNumber)")
                                .font(.subheadline).bold()
                            
                            Spacer()
                            
                            Button(action: { viewModel.selectedPayment = .card}){
                                Image(
                                    systemName:
                                        viewModel.selectedPayment == .card
                                    ? "largecircle.fill.circle"
                                    : "circle"
                                )
                                .foregroundColor(Color.theme.primaryBlue)
                            }
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 16)
                        .background(Color.theme.backgroundBanner.opacity(0.5))
                        .cornerRadius(12)
                    } else{
                        ActionButton(title: "Add debit card", isPrimary: false, action: { viewModel.showDebitCardSheet = true })
                    }
                }
                .padding(16)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
                VStack(alignment: .leading, spacing: 12){
                    Text("Other methods")
                        .font(.subheadline).bold()
                    
                    HStack(spacing: 8){
                        Text("Pay with Apply Pay ")
                            .font(.subheadline)
                            .bold()
                        
                        Spacer()
                        
                        Button(action: {viewModel.selectedPayment = .applePay}){
                            Image(
                                systemName:
                                    viewModel.selectedPayment == .applePay
                                ? "largecircle.fill.circle"
                                : "circle"
                            )
                            .foregroundColor(Color.theme.primaryBlue)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 16)
                    .background(Color.theme.backgroundBanner.opacity(0.5))
                    .cornerRadius(12)
                }
                .padding(16)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
                VStack(spacing: 12){
                    VStack(alignment: .leading, spacing: 8){
                        HStack{
                            Text("Banks")
                                .font(.subheadline).bold()
                            
                            Spacer()
                            
                            HStack(spacing: 4){
                                Image(systemName: "clock")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.theme.primaryText)
                                Text("3-7 days")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.theme.primaryText)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.theme.backgroundBanner.opacity(0.5))
                            .clipShape(Capsule())
                        }
                        
                        Text("Bank transfers are not instant and your investment will be pending until we receive your funds.")
                            .font(.footnote)
                            .fontWeight(.regular)
                    }
                    
                    ActionButton(title: "Add bank account", isPrimary: false, action: { })
                    
                }
                .padding(16)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            }
        }
        .foregroundColor(Color.theme.primaryText)
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
}

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment()
    }
}

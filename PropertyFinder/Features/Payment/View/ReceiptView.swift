//
//  ReceiptView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 03/06/26.
//

import SwiftUI

struct ReceiptView: View {
    @StateObject private var viewModel = ReceiptViewModel()
    
    var body: some View {
        
        VStack(spacing: 24){

            ScrollView(showsIndicators: false){
                
                receiptContent
                    .padding(.bottom, 8)
                
                FundingTimelineComponent()
                
                VStack(spacing:16){
                    ActionButton(title: "View investment portfolio", isPrimary: true, action: { viewModel.didTapViewPortfolio()})
                    
                    ActionButton(title: "Go to search", isPrimary: false, action: { viewModel.didTapGoToSearch()})
                }
                
            }

        }
        .padding(16)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $viewModel.viewPortfolio){
            DashboardView()
        }.navigationDestination(isPresented: $viewModel.goToSearch){
            SearchView()
        }
        
    }
}

extension ReceiptView {
    private var receiptContent: some View {
        VStack(spacing: 16){
            
            VStack(spacing: 24){
                VStack(spacing: 8){
                    Image("SuccessCheck2")
                    
                    Text("Payment successful!")
                        .font(.title2).bold()
                }
                
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Text("Amount paid")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text(viewModel.receipt.amountPaid)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                    
                    HStack{
                        Text("Cash-back earned")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text(viewModel.receipt.cashBackEarned)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                    
                    HStack{
                        Text("Reference number")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text(viewModel.receipt.referenceNumber)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                    
                    HStack{
                        Text("Payment method")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        
                        Spacer()
                        
                        Text(viewModel.receipt.paymentMethod)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }

            }
            .padding(16)
            
            HStack(spacing: 8) {
                ForEach(0..<16, id: \.self) { _ in
                    Circle()
                        .fill(Color.white)
                        .frame(width: 16, height: 16)
                }
            }
            .offset(y: 8)

        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 4)
    }
}

struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}

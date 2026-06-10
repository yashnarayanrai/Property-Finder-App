//
//  FinancialsComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct FinancialsData {
    var propertyPrice: String = "789,000 AED"
    var transactionCosts: String = "+ 114,230 AED"
    var totalInvestmentCost: String = "= 877,800 AED"
    
    var grossRent: String = "52,250 AED"
    var serviceCharge: String = "- 1,230 AED"
    var maintenanceFee: String = "- 6,434 AED"
    var netIncome: String = "= 39,043 AED"
    
    var feeNoticeText: String = "Include Stake's 1.5% fee"
    var ownershipNoticeText: String = "Estimate for the 1st year of ownership"
}

struct FinancialsComponent: View {
    @State var financialsData = FinancialsData()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            Text("Financials")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            VStack{
                VStack(alignment:.leading, spacing:12){
                    Text("Acquisition")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    VStack(spacing: 12){
                        HStack{
                            Text("Property price")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                            Spacer()
                            
                            Text(financialsData.propertyPrice)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image("InfoCircle")
                        }
                        
                        HStack{
                            Text("Transaction costs")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                            Spacer()
                            
                            Text(financialsData.transactionCosts)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image(systemName: "chevron.right")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                }
                .padding(12)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("Investment cost")
                            .font(.body).bold()
                            .foregroundColor(Color.theme.primaryText)
                        
                        Spacer()
                        
                        Text(financialsData.totalInvestmentCost)
                            .font(.body).bold()
                            .foregroundColor(Color.theme.primaryText)
                    }
                    
                    Text(financialsData.feeNoticeText)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .padding(12)
                        .foregroundColor(Color.theme.primaryText)
                        .background(Color.theme.gray.opacity(0.1))
                        .clipShape(Capsule())
                }
                .padding(12)
            }
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            VStack{
                VStack(alignment:.leading, spacing:12){
                    Text("Annual Income")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    VStack(spacing: 12){
                        HStack{
                            Text("Gross rent")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                            Spacer()
                            
                            Text(financialsData.grossRent)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image("InfoCircle")
                        }
                        
                        
                        HStack{
                            Text("Service charge")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                            Spacer()
                            
                            Text(financialsData.serviceCharge)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image("InfoCircle")
                        }
                        
                        
                        HStack{
                            Text("Mgmt. and maintenance")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                            Spacer()
                            
                            Text(financialsData.maintenanceFee)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image("InfoCircle")
                        }
                    }
                }
                .padding(12)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("Net income")
                            .font(.body).bold()
                            .foregroundColor(Color.theme.primaryText)
                        
                        Spacer()
                        
                        Text(financialsData.netIncome)
                            .font(.body).bold()
                            .foregroundColor(Color.theme.primaryText)
                    }
                    
                    
                    HStack(spacing: 4){
                        Text(financialsData.ownershipNoticeText)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.primaryText)
                        Image("InfoCircle")
                    }
                    .padding(12)
                    .background(Color.theme.gray.opacity(0.1))
                    .clipShape(Capsule())
                }
                .padding(12)
            }
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct FinancialsComponent_Previews: PreviewProvider {
    static var previews: some View {
        FinancialsComponent()
    }
}

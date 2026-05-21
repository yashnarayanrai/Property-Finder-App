//
//  LeasingComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct LeasingStrategyData {
    var textDescription: String = "This property leasing strategy is to generate consistent monthly income through annual contracts with long-term tenants."
    var assignedManager: String = "Property manager to be assigned"
    var rentalStatusTitle: String = "Ready for rent"
    var rentalStatusDescription: String = "This property is vacant and we will be actively searching for a tenant."
    var projectedAnnualRent: String = "57,000 AED"
    var guaranteePayoutDate: String = "31 May 2026"
    var guaranteeDetailsText: String = "Your initial rental payment is assured to be made by 31 May 2026, irrespective of the property occupancy status or rent collection."
    var totalRentPaidStat: String = "Stake has paid 45M+ in rent since 2021"
}

struct LeasingStrategyComponent: View {
    @State var dynamicData = LeasingStrategyData()

    var body: some View {
                
        VStack(spacing:16){
            VStack(alignment: .leading, spacing: 12){
                Text("Leasing strategy")
                    .font(.title3).bold()
                    .foregroundColor(Color.theme.primaryText)
                
                Text(dynamicData.textDescription)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.primaryText)
                HStack(spacing: 4){
                    Text(dynamicData.assignedManager)
                    Image("InfoCircle")
                }
                .font(.subheadline)
                .fontWeight(.regular)
                .padding(12)
                .background(Color.theme.gray.opacity(0.1))
                .clipShape(Capsule())
            }

            
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading, spacing: 4){
                    Text(dynamicData.rentalStatusTitle)
                        .font(.body).bold()
                    Text(dynamicData.rentalStatusDescription)
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Projected annual rent")
                        .font(.body).bold()
                    Text(dynamicData.projectedAnnualRent)
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                
                Text(dynamicData.totalRentPaidStat)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding(12)
                    .background(Color.theme.gray.opacity(0.1))
                    .clipShape(Capsule())
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading, spacing:4){
                    Text("Stake guarantee")
                        .font(.body).bold()
                    Text("First payment on \(dynamicData.guaranteePayoutDate)")
                        .font(.body)
                        .fontWeight(.regular)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12){
                    Text(dynamicData.guaranteeDetailsText)
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    HStack(spacing: 4){
                        Text("Learn More")
                            .font(.subheadline)
                            .fontWeight(.regular)
                        Image("InfoCircle")
                    }
                    .padding(12)
                    .background(Color.theme.gray.opacity(0.1))
                    .clipShape(Capsule())
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}

struct LeasingStrategyComponent_Previews: PreviewProvider {
    static var previews: some View {
        LeasingStrategyComponent()
    }
}

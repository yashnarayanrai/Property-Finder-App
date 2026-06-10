//
//  FinancialRowDetailComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct FinancialRowDetailComponent: View {
    var body: some View {
        VStack(spacing: 16){
            VStack{
                
                FinancialRow(label: "5-year total return", value: "48.09%")
                
                Divider()
                
                FinancialRow(label: "Yearly investment return", value: "9.62%")
                
                Divider()
                
                FinancialRow(label: "Projected not yield", value: "5.12%")
                
            }
            .padding(12)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke((Color.theme.gray).opacity(0.3),lineWidth: 1))
            
            Button {
                
            } label: {
                Text("820 people viewed this property")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.primaryText)
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(Color.theme.backgroundBanner)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}

struct FinancialRowDetail: View{
    let label: String
    let value : String
    
    var body: some View{
        HStack{
            Text(label)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color.theme.secondaryText)
            
            Spacer()
            
            HStack(spacing: 12){
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.black)
                
                Image(systemName: "info.circle")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct FinancialRowDetailComponent_Previews: PreviewProvider {
    static var previews: some View {
        FinancialRowDetailComponent()
    }
}

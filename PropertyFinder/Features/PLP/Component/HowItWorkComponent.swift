//
//  HowItWorkComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct HowItWorkComponent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("How it works")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 12){
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 16){
                            Image("BuyIcon")
                            
                            Text("Invest in a piece of this property")
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .padding(16)
                        
                        HStack(spacing: 8){
                            Text("View ownewship documents")
                                .font(.subheadline).bold()
                                .foregroundColor(Color.theme.primaryBlue)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .font(.subheadline).bold()
                                .foregroundColor(Color.theme.primaryBlue)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.backgroundBanner.opacity(0.5))
                    }
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 16){
                            Image("CoinIcon")
                            
                            Text("Earn monnthly rental income")
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .padding(16)
                        
                        Text("View ownewship documents")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.primaryText)
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.theme.backgroundBanner.opacity(0.5))
                    }
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 16){
                            Image("StatsIcon")
                            
                            Text("Watch your investment grow")
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .padding(16)
                        
                        Text("Gain value from appreciation")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.primaryText)
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.theme.backgroundBanner.opacity(0.5))
                        
                    }
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                }
            }
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct HowItWorkComponent_Previews: PreviewProvider {
    static var previews: some View {
        HowItWorkComponent()
    }
}

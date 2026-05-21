//
//  CapitalGrowthComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct CapitalGrowthComponent: View {
    var body: some View {
        VStack(spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text("Captial Growth Investment")
                    .font(.title3).bold()
                
                Text("High appreciation potential due to markets trends, upcoming infrastructure, or prime locations.")
                    .font(.body)
                    .fontWeight(.regular)
            }
            
            VStack(spacing: 16){
                HStack(spacing: 16){
                    Image("OffPlane")
                    
                    Text("Built by of Dubai's leading real estate developers.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                .padding(12)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
                HStack(spacing: 16){
                    Image("community")
                    
                    Text("Built by of Dubai's leading real estate developers.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
                .padding(12)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
            }
            .frame(maxWidth: .infinity)
            
            ActionButton(title: "Learn about investment strategies", isPrimary: false, action: {})
            
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct CapitalGrowthComponent_Previews: PreviewProvider {
    static var previews: some View {
        CapitalGrowthComponent()
    }
}

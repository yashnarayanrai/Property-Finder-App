//
//  InvestButtonComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct InvestButtonComponent: View {
    @State private var value: String = "" 
    
    var body: some View {
        HStack(spacing: 12){
            
            ZStack(alignment: .leading) {
                
                if value.isEmpty {
                    Text("500 AED")
                        .foregroundColor(.black)
                        .padding(.leading, 8)
                }
                
                TextField("", text: $value)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.primaryText)
                    .padding(8)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.theme.primaryText, lineWidth: 1)
            )
            
            ActionButton(title: "Invest Now", isPrimary: true, customHorizontalPadding: 16, action: {print("Invested")})
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct InvestButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        InvestButtonComponent()
    }
}

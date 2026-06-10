//
//  WhyDubai?Component.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct WhyDubaiComponent: View {
    var body: some View {
        VStack(spacing: 20){
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment:.leading, spacing: 8){
                    Text("Why Dubai? why now?")
                        .font(.title3).bold()
                    
                    
                    Text("Dubai property sector leads global growth trends ([Savills,2023](https://savills.com)).")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.secondaryText)
                        .tint(Color.theme.primaryBlue)
                }
                
                HStack(spacing: 12){
                    VStack(alignment: .leading, spacing: 8){
                        HStack{
                            Image(systemName: "globe")
                            Text("+5%")
                                .font(.footnote).bold()
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.3))
                        .foregroundColor(Color.theme.black)
                        .clipShape(Capsule())
                        
                        Text("Avg. global property value growth")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                    
                    
                    VStack(alignment: .leading, spacing: 8){
                        HStack{
                            Text("🇦🇪")
                            Text("+55%")
                                .font(.footnote).bold()
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.3))
                        .foregroundColor(Color.theme.black)
                        .clipShape(Capsule())
                        
                        Text("Dubai property value growth")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                }
            }
            
            ActionButton(title: "View global breakdown", isPrimary: false, action: {})
        }
        .padding(20)
        .background(Color(UIColor.systemBackground))
    }
}

struct WhyDubaiComponent_Previews: PreviewProvider {
    static var previews: some View {
        WhyDubaiComponent()
    }
}

//
//  TheBuildingComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct TheBuildingComponent: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 16){
            
            Text("The building")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            VStack{
                VStack(spacing: 8){
                    VStack(spacing: 8){
                        Image("Logo")
                        
                        Text("Oxford Gardens, Emaar South, Dubai")
                            .font(.callout).bold()
                    }
                    
                    ActionButton(title: "View Map", isPrimary: false, action: { })
                        .background(Color.theme.white)
                        .cornerRadius(12)
                }
                .padding(16)
            }
            .padding(16)
            .background(Color.theme.backgroundBanner.opacity(0.5))
            .cornerRadius(12)
            
            VStack(spacing: 16){
                HStack(spacing: 12){
                    Text("5-year total return")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                    
                    Text("Newly built")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                }
                
                Divider()
                
                HStack(spacing: 12){
                    Text("Floors")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                    
                    Text("11")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryText)
                }
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            HStack(spacing: 16){
                VStack(alignment: .leading, spacing: 4){
                    Text("Developer")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    Text("Samana is dedicated to creating quality residential properties.")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Color(.systemGray4)
                    .frame(width: 89, height: .infinity)
                    .cornerRadius(14)
            }
            .padding(16)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct TheBuildingComponent_Previews: PreviewProvider {
    static var previews: some View {
        TheBuildingComponent()
    }
}

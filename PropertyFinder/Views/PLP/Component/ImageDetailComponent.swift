//
//  ImageDetailComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct ImageDetailComponent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading, spacing: 6){
                Text("3 bed in Opera Grand, Dubai Marina")
                    .font(.title3).bold()
                
                HStack(spacing: 8){
                    Text("355 investors")
                    Text("1,400 AED/sqft")
                }
                .font(.subheadline).foregroundColor(Color.theme.primaryText)
                .fontWeight(.regular)
            }
            
            ProgressView(value: 0.75)
                .scaleEffect(x: 1, y: 2)
                .padding(.vertical,2)
                .tint(Color.theme.primaryBlue)
            
            HStack(spacing: 10){
                HStack(spacing: 8){
                    Text("90% funded")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.theme.gray.opacity(0.3)))
                    
                    Spacer()
                    
                    HStack(spacing: 4){
                        Text("10,000 AED available")
                            .font(.subheadline).bold()
                            .foregroundColor(Color.theme.primaryText)
                        Image("InfoCircle")
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.theme.backgroundBanner.opacity(0.3))
                    .clipShape(Capsule())
                }
                .font(.subheadline).foregroundColor(Color.theme.secondaryText)
                .fontWeight(.regular)
            }
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct ImageDetailComponent_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailComponent()
    }
}

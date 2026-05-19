//
//  CommunityCardView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 14/05/26.
//

import SwiftUI

struct CommunityCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("propertyImage")
                .resizable()
                .frame(width: 220, height: 104)
                .cornerRadius(12)
                .overlay(
                    Text("⭐ 4.8")
                        .padding(6)
                        .background(Color.theme.black.opacity(0.6))
                        .foregroundColor(Color.theme.white)
                        .font(.caption2).bold()
                        .cornerRadius(6)
                        .padding(8),
                    alignment: .bottomLeading
                )
                .overlay(
                    Image(systemName: "bell.circle.fill")
                        .foregroundColor(Color.theme.white)
                        .padding(8),
                alignment: .topTrailing
                )
            
            Text("Palm Jumeirah").font(.headline).bold()
            Text("Range: 85K - 102K AED/year")
                .font(.caption).foregroundColor(Color.theme.secondaryText)
            
            ActionButton(title: "Search More", isPrimary: false) { print("Search Click") }
            
            Text("Explore Community")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.theme.primaryBlue)
                .frame(maxWidth: .infinity)
        }
        .frame(width: 220)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3),lineWidth: 1)
        )
        .shadow(color: Color.theme.black.opacity(0.05), radius: 10, x: 0, y: 10)

    }
}

struct CommunityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCardView()
    }
}

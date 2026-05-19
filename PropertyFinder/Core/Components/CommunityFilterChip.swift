//
//  CommunityFilterChip.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 14/05/26.
//

import SwiftUI

struct CommunityFilterChip: View {
    
    let title: String
    let iconName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            HStack(spacing: 6) {
                Image(iconName)
                    .renderingMode(.template)
                    .font(.subheadline)
                    
                Text(title)
                    .font(.subheadline)
                    
            }
            .padding()
            .foregroundColor(isSelected ? Color.theme.primaryBlue : Color.theme.black)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(isSelected ? Color.theme.primaryBlue : Color.theme.gray.opacity(0.3), lineWidth: 1)
            )
        }
        
    }
}

//struct CommunityFilterChip_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityFilterChip()
//    }
//}

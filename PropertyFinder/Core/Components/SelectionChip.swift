//
//  SelectionChip.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 19/05/26.
//

import SwiftUI

struct SelectionChip: View {
    let title : String
    
    var systemIcon : String? = nil
    var assetIcon : String? = nil
    
    let isSelected: Bool
    
    var activeColor: Color = Color.theme.primaryBlue
    var inactiveColor: Color = Color.theme.black
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            if let systemIcon = systemIcon {
                Image(systemName: systemIcon)
                    .font(.subheadline)
            }
            
            if let assetIcon = assetIcon {
                Image(assetIcon)
                    .renderingMode(.template)

            }
            
            Text(title)
                .font(.subheadline)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        // Dynamic theme switching parameters
        .background(isSelected ? activeColor.opacity(0.1) : Color.clear)
        .foregroundColor(isSelected ? activeColor : inactiveColor)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(isSelected ? activeColor : Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

//struct SelectionChip_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectionChip1()
//    }
//}

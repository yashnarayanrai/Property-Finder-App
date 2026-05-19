//
//  CapsuleButton.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 19/05/26.
//

import SwiftUI

struct CapsuleButton: View {
    
    let title : String
    var iconName : String? = nil
    
    var textColor : Color = Color.theme.black
    var borderColor : Color = Color.theme.gray
    var backgroundColor : Color = .clear
    
    var horizontalPadding: CGFloat = 12
    var verticalPadding: CGFloat = 8
    
    let action: (()-> Void)?
    
    var body: some View {
        Group{
            if let buttonAction = action {
                Button(action: buttonAction){
                    buttonContent
                }
            } else {
                buttonContent
            }
        }
    }
    
    private var buttonContent: some View{
        HStack(spacing: 10){
            Text(title)
            
            if let icon = iconName {
                Image(systemName: icon)
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .background(backgroundColor)
        .foregroundColor(textColor)
        .clipShape(Capsule())
        .overlay(
            Capsule().stroke(borderColor, lineWidth: 1)
        )
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            // Test 1: Action Button with Icon (Like Filters Button)
            CapsuleButton(title: "Filters", iconName: "line.3.horizontal.decrease", textColor: .blue) {
                print("Filters clicked")
            }
            
            // Test 2: Static Text Tag (Like Fractional Investment)
            CapsuleButton(title: "Fractional investment", textColor: .indigo, borderColor: .indigo.opacity(0.4), action: nil)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

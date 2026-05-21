//
//  ActionButton.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 14/05/26.
//

import SwiftUI

struct ActionButton: View {
    
    let title: String
    let isPrimary: Bool
    var customHorizontalPadding: CGFloat? = nil
    var customVerticalPadding: CGFloat? = nil
    
    // 👉 Boolean Flag: Default adaptive look apply karne ke liye
    var useDefaultNativePadding: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(maxWidth: (customHorizontalPadding == nil && !useDefaultNativePadding) ? .infinity : nil)
                .modifier(PaddingModifier(
                    horizontal: customHorizontalPadding,
                    vertical: customVerticalPadding,
                    useNative: useDefaultNativePadding
                ))
                .background(isPrimary ? Color.theme.accent : Color.clear)
                .foregroundColor(isPrimary ? Color.theme.white : Color.theme.primaryBlue)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isPrimary ? Color.clear : Color.theme.primaryBlue, lineWidth: 1)
                )
        }
    }
}

struct PaddingModifier: ViewModifier {
    let horizontal: CGFloat?
    let vertical: CGFloat?
    let useNative: Bool
    
    func body(content: Content) -> some View {
        if useNative {
            // 👉 Case 1: Agar useDefaultNativePadding true h toh automatic .padding() chalega
            content.padding().frame(maxWidth: .infinity)
        } else {
            // 👉 Case 2: Agar user ne custom numbers diye hain ya default frame spacing h
            content
                .padding(.horizontal, horizontal ?? 12)
                .padding(.vertical, vertical ?? 12)
        }
    }
}
//struct ActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionButton()
//    }
//}

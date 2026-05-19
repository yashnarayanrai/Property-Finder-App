//
//  AppColor.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let gray = Color("GrayColor")
    
    let black = Color("BlackColor")
    let white = Color("WhiteColor")
    
    let primaryBlue = Color("PrimaryBlue")
    let secondaryBlue = Color("SecondaryBlue")
    
    let primaryText = Color("PrimaryText")
    let secondaryText = Color("SecondaryText")
    
    let background = Color("Background")
    let backgroundBanner = Color("BackgroundBanner")
    
    let gradiant1 = Color("Gradiant1")
    let gradiant2 = Color("Gradiant2")
    
}



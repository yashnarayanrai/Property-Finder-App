//
//  CapitalGrowth.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 19/05/26.
//

import SwiftUI

struct CapitalGrowth: View {
    var body: some View {
        ZStack{
            Color.theme.backgroundBanner.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false){
                Text("Hello ")
            }
        }
    }
}

struct CapitalGrowth_Previews: PreviewProvider {
    static var previews: some View {
        CapitalGrowth()
    }
}

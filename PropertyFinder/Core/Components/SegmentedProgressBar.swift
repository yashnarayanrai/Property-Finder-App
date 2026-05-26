//
//  SegmentedProgressBar.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 25/05/26.
//

import SwiftUI

struct SegmentedProgressBar: View{
    let totalSteps: Int
    let currentStep: Int
    
    var body: some View{
        HStack{
            ForEach(1...totalSteps, id: \.self) { index in
                Capsule()
                    .fill(index < currentStep ? Color.theme.primaryBlue : Color.gray.opacity(0.2))
                    .frame(height: 4)
            }
        }
    }
}

struct SegmentedProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedProgressBar(totalSteps: 4, currentStep: 3)
    }
}

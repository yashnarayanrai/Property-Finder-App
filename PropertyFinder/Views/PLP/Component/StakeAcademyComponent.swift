//
//  StakeAcademyComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct StakeAcademyComponent: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            Text("Stake academy")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            HStack(spacing: 16){
                VStack(alignment: .leading, spacing: 4){
                    Text("Properties on stake")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    Text("Rami explain how our experts source and manage properties (8 mins).")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                
                ZStack {
                    // Gray Rounded Thumbnail Card
                    Color(.systemGray4)
                        .frame(width: 89, height: .infinity)
                        .cornerRadius(14)
                    
                    // Native Video Play Circle Icon
                    Image(systemName: "play.circle")
                        .font(.system(size: 24, weight: .regular))
                        .foregroundColor(.white)
                }
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

struct StakeAcademyComponent_Previews: PreviewProvider {
    static var previews: some View {
        StakeAcademyComponent()
    }
}

//
//  Exit options.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 21/05/26.
//

import SwiftUI

struct ExitOptionsData {
    var exitWindowDescription: String = "Exit the property early after 1 year by selling shares in our biannual exit window."
    var nextWindowDates: String = "5 May 2026 - 19 May 2026, 00:00 AM"
    var fullSaleDescription: String = "Upon a successful sale, you will receive a payment reflecting the increase in the property's value."
}

struct ExitOptions: View {
    @State var exitData = ExitOptionsData()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Exit options")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            VStack(alignment: .leading, spacing: 16){
                VStack(alignment: .leading, spacing:4){
                    Text("Exit window")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    Text(exitData.exitWindowDescription)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12){
                    Text("Next exit window")
                        .font(.body).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    Text(exitData.nextWindowDates)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Button(action: { }){
                        HStack(spacing: 4){
                            Text("Set exit window reminder")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            Image(systemName: "bell")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                        }
                    }
                    .padding(12)
                    .background(Color.theme.gray.opacity(0.1))
                    .clipShape(Capsule())
                }
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
            
            VStack(alignment: .leading, spacing: 12){
                Text("Full sale of property")
                    .font(.body).bold()
                    .foregroundColor(Color.theme.primaryText)
                Text(exitData.fullSaleDescription)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color.theme.primaryText)
                    
            }
            .padding(16)
            .cornerRadius(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct ExitOptions_Previews: PreviewProvider {
    static var previews: some View {
        ExitOptions()
    }
}

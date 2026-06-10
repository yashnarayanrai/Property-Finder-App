//
//  DocumentsComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct DocumentsComponent: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 16){
            Text("Documents")
                .font(.title3).bold()
                .foregroundColor(Color.theme.primaryText)
            
            VStack(spacing: 16){
                HStack(spacing: 12){
                    Text("5-year total return")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                    
                    Text("XSLX")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                
                Divider()
                
                HStack(spacing: 12){
                    Text("Valuation Report")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Spacer()
                    
                    Text("PDF")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                    
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
            }
            .padding(16)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct DocumentsComponent_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsComponent()
    }
}

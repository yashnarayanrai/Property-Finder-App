//
//  AppHeaderView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 01/06/26.
//

import SwiftUI

struct AppHeaderView: View {
    
    let title: String
    let backAction: () -> Void
    
    var body: some View {
        HStack{
            
            Button(action: {
                backAction()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(Color.theme.black)
            }
            
            Spacer()
            
            Text(title)
                .font(.title3.bold())
                .foregroundColor(Color.theme.primaryText)
            
            Spacer()
            
            Image(systemName: "arrow.backward")
                .opacity(0)
        }
        .padding(16)
    }
}

struct AppHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AppHeaderView(title: "heelo", backAction: {})
    }
}

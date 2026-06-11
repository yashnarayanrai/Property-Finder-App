//
//  AccountView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack{
            Text("Hello, Account")
            Spacer()
            ActionButton(title: "Logout", isPrimary: true, action: {
                
                Task {
                    do {
                        try await AuthService().logout()
                    } catch {
                        print(error)
                    }
                }
            })
        }
        .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

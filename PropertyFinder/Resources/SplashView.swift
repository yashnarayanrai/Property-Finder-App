//
//  SplashView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/06/26.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isLoggedIn = false
    @State private var isChecking = true
    
    var body: some View {
        Group{
            if isChecking{
                ProgressView()
            } else if isLoggedIn {
                MainRootView()
            } else {
                MainRootView()
            }
        }
        .onAppear{
            print("Token:", KeychainManager.shared.getToken() ?? "No Found")

        }
        .task {
            
            let token = KeychainManager.shared.getToken()
            
            isLoggedIn = token != nil
            
            isChecking = false
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

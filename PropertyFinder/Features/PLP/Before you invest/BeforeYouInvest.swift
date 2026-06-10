//
//  BeforeYouInvest.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 22/05/26.
//

import SwiftUI

struct BeforeYouInvest: View {
    @State private var isContinue : Bool = false
    var body: some View {
        VStack(spacing: 24){
            
            Spacer()
            
            VStack(spacing:16){
                Image("ShieldIcon")
                
                VStack(spacing: 8){
                    Text("Before you invest...")
                        .font(.title3).bold()
                        .foregroundColor(Color.theme.primaryText)
                    
                    Text("Stake is regulated by the DFSA, which means we are required to collect certain information from you.")
                        .font(.callout)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer()
            
//            Button
            VStack(spacing: 24){
                HStack(spacing:12){
                    Color.theme.white
                        .frame(width: 48, height: 48)
                        .cornerRadius(8)
                    
                    Text("We use a trusted third-party service called IDWise to verify information.")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.theme.primaryText)
                }
                .padding(12)
                .background(Color.theme.backgroundBanner.opacity(0.5))
                .cornerRadius(12)

                
                ActionButton(title: "Continue", isPrimary: true, action: { isContinue = true })
            }
        }
        .padding(16)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $isContinue){
            AccountSetUp()
        }
    }
}

struct BeforeYouInvest_Previews: PreviewProvider {
    static var previews: some View {
        BeforeYouInvest()
    }
}

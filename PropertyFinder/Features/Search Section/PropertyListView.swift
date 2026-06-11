//
//  PropertyListView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

struct PropertyListView: View {
    
    @State private var showRegisterView = false
    @State private var showLogin = false
    @State private var goToCheckEmail = false
    @State private var enteredEmail = ""
    @State private var goToDetail = false
    
    @Environment(\.dismiss) var dismiss
//    @Environment(\.currentAppPhase) var appPhase
    @Environment(\.scenePhase) private var scenePhase
   
    
    
    @AppStorage("isTermsAccepted") var isTermsAccepted = false
    
    private var isUserLoggedIn: Bool {
        KeychainManager.shared.getToken() != nil
      
    }
    
//    func logout() {
//
//        KeychainManager.shared.deleteToken()
//
//    }
    
//    
    init() {
        // #if DEBUG ka matlab hai: Yeh code sirf tab chalega jab aap Xcode se Simulator par run karoge.
        // Jab aap app Store par live bhejoge, toh ye automatic band ho jayega.
        #if DEBUG
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.set(false, forKey: "isTermsAccepted")
        #endif
        
    }
//
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            ZStack(alignment: .bottomTrailing){
                Image("propertyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Text("Caption Growth")
                    .font(.caption2).bold()
                    .foregroundColor(Color.theme.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.theme.gray.opacity(0.6))
                    .clipShape(Capsule())
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                VStack(spacing: 10){
                    CircleIcon(name: "play.fill")
                    CircleIcon(name: "arrow.counterclockwise.circle")
                }
                .padding(12)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                
//                Multiple image using ForEach
                
            }
            .cornerRadius(15)
            
//            Property Info
            VStack(alignment: .leading,spacing: 4) {
                Text("2,070,500 AED")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("3 bed in Opera Grand, Dubai Marina")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.gray.opacity(0.8))
            }
            .padding(.horizontal, 5)
            
            
            if isUserLoggedIn && isTermsAccepted {
                                
                VStack(spacing: 10){
                    
                    // Figma Style Progress Bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 6)
                            
                            Capsule()
                                .fill(Color.purple)
                                .frame(width: geo.size.width * 0.9, height: 6) // 90% Funded look
                        }
                    }
                    .frame(height: 6)
                    .padding(.vertical, 4)
                    
                    FinancialRow(label: "5 year total return", value: "48.24%")
                    
                    // Financial Row 2
                    FinancialRow(label: "Yearly investment return", value: "9.63%")
                    
                    // Financial Row 3
                    FinancialRow(label: "Projected net yield", value: "5.11%")
                    
                    

                }
                .transition(.opacity.combined(with: .move(edge: .bottom)))
                .onTapGesture {
                    if isUserLoggedIn && isTermsAccepted {
                        goToDetail = true
                    }
                }
                

                
            } else {
                Button(action: {
                    showLogin = true
                }) {
                    HStack{
                        Image(systemName: "lock.fill")
                        Text("Unlock")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.theme.white)
                    .foregroundColor(Color.theme.primaryBlue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.theme.primaryBlue,lineWidth: 1)
                    )
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .shadow(color: Color.theme.black.opacity(0.05), radius: 10, x: 0, y: 10)
        
//        .onChange(of: appPhase) { newPhase in
//            if newPhase == .background {
//                print("💾 Property Card: App background mein chali gayi! Heavy animations ko pause kar do.")
//            } else if newPhase == .active {
//                print("🔄 Property Card: App active ho gayi! Fresh prices ya values reload karo.")
//            }
//        }
        
        .blur(radius: scenePhase == .active ? 0 : 10)
        .animation(.default, value: scenePhase)
        
//        .onAppear {
//            isUserLoggedIn = false
//            isTermsAccepted = false
//        }
        .navigationDestination(isPresented: $goToCheckEmail) {

            CheckEmailView(
                email: enteredEmail,
                goToCheckEmail: $goToCheckEmail
            )
        }
        
        .navigationDestination(isPresented: $goToDetail){
            PropertyDetails()
        }
        
        .navigationDestination(isPresented: $showRegisterView){
            RegisterView(onRegisterSuccess: { email in
                enteredEmail = email
                
                showRegisterView = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showLogin = true
                }
            })
        }
        
        .onAppear{
            print("Token:", KeychainManager.shared.getToken() ?? "No Found")
            
            print("Terms::",isTermsAccepted)
        }
        
        .sheet(isPresented: $showLogin){
            LoginView(onLoginSuccess: {
                
                showLogin = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    goToCheckEmail = true
                }
                
            }, onRegisterTab: {
                showLogin = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    showRegisterView = true
                }
            })
            .presentationDetents([.medium])
        }
    }
}


struct CircleIcon:View{
    let name : String
    var body: some View{
        Image(systemName: name)
            .font(.caption)
            .padding(8)
            .background(Color.theme.white.opacity(0.8))
            .clipShape(Circle())
    }
}

struct FinancialRow: View{
    let label: String
    let value: String
    
    var body: some View{
        HStack{
            Text(label)
                .font(.footnote)
                .foregroundColor(Color.theme.secondaryText)
            Spacer()
            Text(value)
                .font(.footnote)
                .fontWeight(.bold)
        }
    }
}

//struct PropertyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PropertyListView()
//    }
//}

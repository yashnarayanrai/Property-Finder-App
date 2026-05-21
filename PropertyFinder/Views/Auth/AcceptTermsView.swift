//
//  AcceptTerm.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 15/05/26.
//

import SwiftUI
import PDFKit

struct AcceptTermsView: View {
    @State private var isAgreed = false
    @State private var navigateToPDF = false
    @Environment(\.dismiss) var dismiss
    @Binding var goToCheckEmail: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action: { dismiss() }){
                        Image(systemName: "arrow.backward")
                            .font(.title3)
                            .foregroundColor(Color.theme.black)
                    }
                    Spacer()
                    Image("LogoFrame")
                    Spacer()
                }
                
                Spacer()
                
                VStack(spacing: 10){
                    Image("EmploymentDetailIcon")
                    
                    Text("Please read Stake's term to continue")
                        .font(.title3)

                        .foregroundColor(Color.theme.primaryText)
                        
                    Text("We'll use your Property Finder account to securely create and link your Stake's account.")
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack{
                    
                    HStack(spacing: 10){
                        Button(action: {isAgreed.toggle()}){
                            Image(systemName: isAgreed ? "checkmark.square.fill" : "square")
                                .font(.title3)
                                .foregroundColor(Color.theme.primaryBlue)
                        }
                        
                        (
                            Text("I agree to Property Finder's ")
                                 +
                            Text(" data processing terms")
                                .foregroundColor(Color.theme.primaryBlue)
                                .underline()
                            +
                            Text(" and to share my details with Stake.")
                        
                        )
                        .font(.footnote)
                        .foregroundColor(Color.theme.gray)
                        
                         
                            
                    }
                    .padding()
                    .background(Color.theme.backgroundBanner)
                    .cornerRadius(12)
                    
                    ActionButton(title: "Read terms and conditions", isPrimary: true,useDefaultNativePadding: true,action: {
                        if isAgreed {
                            print("Button Clicked")
                            navigateToPDF = true
                        }
                    })
                }
            }
            .padding()
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToPDF) {
                TermsPDFReaderView(goToCheckEmail: $goToCheckEmail)
            }
        }
    }
}

//struct AcceptTermsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            AcceptTermsView(
//                AcceptTermsView(goToCheckEmail: $goToCheckEmail)
//            )
//        }
//    }
//}


struct PDFViewer: UIViewRepresentable {
    
    let pdfName: String
    @Binding var scrollToButton: Bool
    
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.backgroundColor = .white
        pdfView.displayMode = .singlePageContinuous
        pdfView.autoScales = true
        
        if let url = Bundle.main.url(forResource: pdfName, withExtension: "pdf") {
            pdfView.document = PDFDocument(url: url)
        } else {
            print("❌ ERROR: \(pdfName).pdf file not found!")
        }
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        if scrollToButton {
            DispatchQueue.main.async {
                if let document = uiView.document {
                    let totalPage = document.pageCount
                    if totalPage > 0 {
                        if let lastPage = document.page(at: totalPage - 1){
                            uiView.go(to: lastPage)
                        }
                    }
                }
                scrollToButton = false
            }
        }
    }
    
//    func updateUIView(_ uiView: PDFView, context: Context) {
//        if scrollToButton {
//            DispatchQueue.main.async {
//                if let document = uiView.document {
//                    let totalPages = document.pageCount
//                    if totalPages > 0 {
//                        // 👉 FIX: Last page index hamesha totalPages - 1 hota h (0-indexed base)
//                        if let lastPage = document.page(at: totalPages - 1) {
//                            uiView.go(to: lastPage)
//                        }
//                    }
//                }
//                scrollToButton = false
//            }
//        }
//    }
}



//Term PDF Reader View

struct TermsPDFReaderView: View {
    
    @State private var showFailedPopup = false
    @State private var isDownload = false
    @State private var scrollToBottom = false
    @State private var hasScrolledToBottom = false
    
    @Environment(\.dismiss) var dismiss
    @Binding var goToCheckEmail: Bool
    
    @AppStorage("isUserLoggedIn") var isUserLoggedIn = false
    @AppStorage("isTermsAccepted") var isTermsAccepted = false
    @AppStorage("isEmailSentState") var isEmailSentState = false
    

    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: { dismiss() }){
                        Image(systemName: "arrow.backward")
                            .font(.title3)
                            .foregroundColor(Color.theme.black)
                    }
                    Spacer()
                    Text("Read terms and conditions")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.black)
                    Spacer()
                    Button(action: {showFailedPopup = true}){
                        Image(systemName: "square.and.arrow.down")
                            .font(.title3)
                            .foregroundColor(Color.theme.black)
                        
                    }
                }
                
                Divider()
                
                PDFViewer(
                    pdfName: "Terms",
                    scrollToButton: $scrollToBottom,
                    isAtBottom: $hasScrolledToBottom
                )
                .overlay(
                    Button(action: {
                        
                        scrollToBottom = true

                    }){
                        Image(systemName: "arrow.down")
                            .font(.title3)
                            .foregroundColor(Color.theme.black)
                            .padding(14)
                            .background(Color.theme.backgroundBanner)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(),
                    alignment: .bottomTrailing
                )
                
                Divider()
                
                ActionButton(title: "Accepts and continues", isPrimary: true,useDefaultNativePadding: true){
                    
                    isUserLoggedIn = true
                    isTermsAccepted = true
                    
                    goToCheckEmail = false
                    
                    print("Accept Terms")
                    dismiss()
                }
                    
            }
            .padding()
            .disabled(!hasScrolledToBottom)

            
            //            Download Failed Popup
            
            if showFailedPopup {
                Color.theme.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showFailedPopup = false
                    }
                
                VStack{
                    HStack{
                        Button(action: {showFailedPopup = false}){
                            Spacer()
                            Image(systemName: "xmark")
                                .foregroundColor(Color.theme.primaryBlue)
                        }
                        
                    }
                    
                    Image("WarningIcon")
                    
                    Text("Download Failed")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Please check your internet connection and then try again.")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.black)
                        .multilineTextAlignment(.center)
                    
                    ActionButton(title: "Try Again", isPrimary: true, useDefaultNativePadding: true, action: {showFailedPopup = true})
                }
                .padding()
                .background(Color.theme.backgroundBanner)
                .cornerRadius(25)
                .shadow(radius: 20)
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
    }
}

struct TermsPDFReaderView_Previews: PreviewProvider {
    static var previews: some View {
        TermsPDFReaderView(goToCheckEmail: .constant(true))
    }
}

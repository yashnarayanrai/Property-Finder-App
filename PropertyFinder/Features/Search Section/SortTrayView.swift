//
//  SortTrayView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 18/05/26.
//

import SwiftUI

enum SortOption: String, CaseIterable {
    case funding = "Funding percentage"
    case returnRate = "Yearly investment"
    case netYield = "Projected net yield"
    case price = "Property price"
    
    var value: String{
        "High to low"
    }
}

struct SortTrayView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedSort: SortOption
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 12){
                HStack {
                    Text("Sort by")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.theme.gray)
                            .font(.title2)
                    }
                }
                
                
                VStack(spacing:0){
                    ForEach(SortOption.allCases, id:\.self){ option in
                        Button(action: {
                            selectedSort = option
                            dismiss()
                        }) {
                            HStack{
                                Text(option.rawValue)
                                    .font(.body)
                                    .foregroundColor(selectedSort == option ? Color.theme.primaryBlue : Color.theme.black)
                                
                                
                                Spacer()
                                
                                Text(option.value)
                                    .font(.body)
                                    .foregroundColor(selectedSort == option ? Color.theme.primaryBlue : Color.theme.gray)
                                
                            }
                            .padding()
                            .background(selectedSort == option ? Color.theme.primaryBlue.opacity(0.12): Color.clear)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
            }
            .padding()
        }
    }
}


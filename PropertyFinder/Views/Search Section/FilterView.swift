//
//  FilterView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 18/05/26.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var listingType = "Available"
    @State private var investmentReturn: Double = 8.0
    @State private var netYield: Double = 4.0
    @State private var purchasePrice: Double = 4.5
    @State private var selectedStrategy = "Capital growth"
    @State private var bedrooms = "2"
    @State private var selectedLocations: Set<String> = ["Dubai Marina", "Downtown Dubai"]
    
    let locationsGrid = [
        "Jumeirah Village Circle", "Dubai Marina", "MBR City",
        "Downtown Dubai", "Business Bay", "DIFC", "Dubai Hills",
        "Jumeirah Lake Towers", "Dubai Studio City", "Arjan"
    ]
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                VStack(alignment: .leading, spacing:20) {
                    Button("Cancel") { dismiss() }
                        .font(.body)
                        .foregroundColor(Color.theme.primaryBlue)
                    
                    Text("Filter")
                        .font(.title3)
                        .foregroundColor(Color.theme.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                
                ScrollView(showsIndicators: false){
                    VStack{
                        // 1. Listing Type Chips
                        FilterSection(title: "Listing type", icon: "doc.text") {
                            HStack(spacing: 12) {
                                ForEach(["Available", "Funded", "Exited"], id: \.self) { type in
                                    SelectionChip(title: type, isSelected: listingType == type) {
                                        listingType = type
                                    }
                                }
                            }
                        }
                        
                        // 2. Yearly Investment Return Slider
                        FilterSection(title: "Yearly investment return", icon: "chart.line.uptrend.xyaxis", rightText: "\(Int(investmentReturn))%+") {
                            Slider(value: $investmentReturn, in: 0...20, step: 1)
                                .tint(Color.theme.primaryBlue)
                        }
                        
                        // 3. Projected Net Yield Slider
                        FilterSection(title: "Projected net yield", icon: "percent", rightText: "\(Int(netYield))%+") {
                            Slider(value: $netYield, in: 0...15, step: 1)
                                .tint(Color.theme.primaryBlue)
                        }
                        
                        FilterSection(title: "Purchase price", icon: "percent", rightText: "\(Int(purchasePrice))M+") {
                            Slider(value: $purchasePrice, in: 0...15, step: 1)
                                .tint(Color.theme.primaryBlue)
                        }
                        // 4. Investment Strategy Chips
                        FilterSection(title: "Investment strategy", icon: "lightbulb") {
                            HStack(spacing: 12) {
                                ForEach(["Capital growth", "High yield", "Prime"], id: \.self) { strategy in
                                    SelectionChip(title: strategy, isSelected: selectedStrategy == strategy) {
                                        selectedStrategy = strategy
                                    }
                                }
                            }
                        }
                        // 5. Bedrooms Selector Grid
                        FilterSection(title: "Bedrooms", icon: "bed.double") {
                            HStack(spacing: 12) {
                                ForEach(["Studio", "1", "2", "3+"], id: \.self) { bed in
                                    SelectionChip(title: bed, isSelected: bedrooms == bed) {
                                        bedrooms = bed
                                    }
                                }
                            }
                        }
                        // 6. Locations Wrap Layout Grid Flow
                        VStack(spacing: 12){
                            FilterSection(title: "Locations", icon: "mappin.and.ellipse") {
                                FlowLayout(items: locationsGrid) { loc in
                                    SelectionChip(title: loc, isSelected: selectedLocations.contains(loc)) {
                                        if selectedLocations.contains(loc) {
                                            selectedLocations.remove(loc)
                                        } else {
                                            selectedLocations.insert(loc)
                                        }
                                    }
                                }
                            }
                            
                            Button(action: {}) {
                                HStack {
                                    Text("Show more").font(.subheadline)
                                    Image(systemName: "chevron.down").font(.subheadline)
                                }
                                .foregroundColor(Color.theme.primaryBlue)
                                .padding(.bottom)
                            }
                        }
                        .background(Color.theme.white)
                        .cornerRadius(16)
                    }
                }
                .padding()
                
                HStack{
                    Button(action: { dismiss() }){
                        Text("Clear all")
                            .foregroundColor(Color.theme.primaryBlue)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    ActionButton(title: "Show Properties", isPrimary: true, customHorizontalPadding: 12, action: {dismiss()})
                }
                .padding()
                .background(Color.theme.white)
            }
        }
        .background(Color.theme.backgroundBanner)
    }
}


struct FilterSection<Content: View>: View {
    let title: String
    let icon: String
    var rightText: String? = nil
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon).foregroundColor(.gray).font(.subheadline)
                Text(title).font(.callout)
                Spacer()
                if let rightText = rightText {
                    Text(rightText).font(.subheadline).foregroundColor(.purple).fontWeight(.semibold)
                }
            }
            content()
        }
        .padding()
        .background(Color.theme.white)
        .cornerRadius(16)
    }
}

struct FlowLayout: View {
    let items: [String]
    let content: (String) -> SelectionChip
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // SwiftUI native grid simulation to align custom layout structures comfortably
            ForEach(0..<items.count/2 + 1, id: \.self) { rowIndex in
                HStack(spacing: 8) {
                    if rowIndex * 2 < items.count {
                        content(items[rowIndex * 2])
                    }
                    if rowIndex * 2 + 1 < items.count {
                        content(items[rowIndex * 2 + 1])
                    }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

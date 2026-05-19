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
    @State private var selectedStrategy = "Capital growth"
    @State private var bedrooms = "2"
    @State private var selectedLocations: Set<String> = ["Dubai Marina", "Downtown Dubai"]
    
    let locationsGrid = [
        "Jumeirah Village Circle", "Dubai Marina", "MBR City",
        "Downtown Dubai", "Business Bay", "DIFC", "Dubai Hills",
        "Jumeirah Lake Towers", "Dubai Studio City", "Arjan"
    ]
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing:20) {
                Button("Cancel") { dismiss() }
                    .foregroundColor(Color.theme.primaryBlue)
                
                Text("Filter")
                    .font(.headline)
                    .foregroundColor(Color.theme.black)
            }
            .padding()
            
            
            ScrollView{
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
                            .accentColor(Color.theme.primaryBlue)
                    }
                    
                    // 3. Projected Net Yield Slider
                    FilterSection(title: "Projected net yield", icon: "percent", rightText: "\(Int(netYield))%+") {
                        Slider(value: $netYield, in: 0...15, step: 1)
                            .accentColor(Color.theme.primaryBlue)
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
                                Text("Show more").font(.footnote)
                                Image(systemName: "chevron.down").font(.caption2)
                            }
                            .foregroundColor(Color.theme.primaryBlue)
                            .padding()
                        }
                    }
                }
                .padding()
            }
            
            
            // --- BOTTOM SUBMIT TRIGGER ---
            Button(action: { dismiss() }) {
                Text("Show properties")
                    .font(.headline).bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(12)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
        }
    }
    
//    func resetFilters() {
//        listingType = "Available"
//        investmentReturn = 8.0
//        netYield = 4.0
//        selectedStrategy = "Capital growth"
//        bedrooms = "2"
//        selectedLocations.removeAll()
//    }



struct FilterSection<Content: View>: View {
    let title: String
    let icon: String
    var rightText: String? = nil
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon).foregroundColor(.gray).font(.subheadline)
                Text(title).font(.subheadline).fontWeight(.bold)
                Spacer()
                if let rightText = rightText {
                    Text(rightText).font(.subheadline).foregroundColor(.purple).fontWeight(.semibold)
                }
            }
            content()
        }
        .padding()
        .background(Color(.systemGray6).opacity(0.4))
        .cornerRadius(16)
    }
}

struct SelectionChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.footnote)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? Color.purple.opacity(0.1) : Color(UIColor.systemBackground))
                .foregroundColor(isSelected ? .purple : .black)
                .clipShape(Capsule())
                .overlay(
                    Capsule().stroke(isSelected ? Color.purple : Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
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

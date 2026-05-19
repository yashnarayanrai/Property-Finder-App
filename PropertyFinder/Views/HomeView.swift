//
//  HomeView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

struct HomeView: View {
    @State private var searchMode: String = "Rent"
    @State private var searchKeywords: String = ""
    @State private var selectedFilterIndex = 0
    
    let filters = [
        ("Luxury Living", "Diamond"),
        ("View of water", "SunWater"),
        ("Golf community", "Icon1")
    ]
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            ScrollView(.vertical,showsIndicators: false){
                VStack(spacing: 12){
                    
                    // Segment selector (Rent or Buy)
                    HStack(){
                        ForEach(["Rent","Buy"], id: \.self){ mode in
                            Text(mode)
                                .font(.subheadline).bold()
                                .frame(maxWidth: .infinity)
                                .padding(.vertical,10)
                                .background(searchMode == mode ? Color.theme.white : Color.clear)
                                .foregroundColor(Color.theme.black)
                                .cornerRadius(20)
                                .shadow(color: Color.theme.black.opacity(0.1), radius: 10, x: 0, y: 10)
                                .onTapGesture{
                                    searchMode = mode
                                }
                        }
                    }
                    .padding(4)
                    .background(Color.theme.gray.opacity(0.2))
                    .cornerRadius(24)
                    .padding(.horizontal)
                    
                    
                    // --- SEARCH PLACEHOLDER BOX ---
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(Color.theme.gray)
                        TextField("Try \"2 bedroom with a balcony near...", text: $searchKeywords)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25)
                        .fill(Color.theme.white))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(
                        LinearGradient(colors: [Color.theme.gradiant1, Color.theme.gradiant2], startPoint: .leading, endPoint: .trailing)
                        , lineWidth: 1))
                    .padding(.horizontal)
                    
                    
                    
                    // --- STAKE INVESTMENT AD CARD PROMOTIONAL BANNER ---
                    VStack{
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("Invest in Dubai real estate from AED 500 with Stake")
                                        .font(.headline).bold()
                                    Text("Join 2 million investors who earned an average of 10% in 2025.")
                                        .font(.caption).foregroundColor(Color.theme.gray)
                                }
                                Spacer()
                                Image("SpotIcon") // Placeholder graph art icon
                            }
                            
                            HStack(spacing: 12) {
                                ActionButton(title: "Learn more", isPrimary: false) { print("Promo Click") }
                                ActionButton(title: "Invest now", isPrimary: true) { print("Invest Click") }
                            }
                        }
                        .padding()
                        .background(Color.theme.backgroundBanner.opacity(0.5))
                        .cornerRadius(16)
                        .shadow(color: Color.theme.black.opacity(0.04), radius: 10)
                    }
                    .padding(10)
                    .background(Color.theme.white)
                    
                    
                    // --- TOP COMMUNITIES CAROUSEL GRID ---
                    VStack{
                        VStack{
                            HStack(spacing: 6) {
                                Image("TopIcon")
                                Text("Search by top communities")
                                    .font(.title3).bold()
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Chips Horizontal Loop Slider
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<filters.count, id: \.self) { index in
                                    CommunityFilterChip(
                                        title: filters[index].0,
                                        iconName: filters[index].1,
                                        isSelected: selectedFilterIndex == index
                                    ) {
                                        selectedFilterIndex = index
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Community Bottom Cards Mock (Horizontal Feed)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0..<3) { _ in
                                    CommunityCardView()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    .background(Color.theme.white)
                }
            }
            .padding(.top)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

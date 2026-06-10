//
//  SearchHeaderView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI


struct SearchHeaderView: View {
    
    @State private var showSortSheet = false
    @State private var currentSort: SortOption = .funding
    
    @State private var showFilterTray = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 25){
                
    //          Header Bar Search, Filter, Fractional
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:10){
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Color.theme.primaryBlue)
                        .clipShape(Capsule())
                        
                        
                        CapsuleButton(title: "Filters", iconName: "line.3.horizontal.decrease"){
                            showFilterTray = true
                        }
                        
                        CapsuleButton(title: "Fractional investment"){
                            print("Fractional investment")
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 4){
                    Text("2,809 properties")
                        .font(.subheadline)
                        .foregroundColor(Color.theme.gray)
                    
                    HStack{
                        Text("Properties in Dubai")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {showSortSheet = true}){
                            Image(systemName: "arrow.up.arrow.down")
                                .font(.title3)
                                .foregroundColor(Color.theme.black)
                        }
                            
                    }
                }
            }
            .padding()
            .sheet(isPresented: $showSortSheet){
                SortTrayView(selectedSort: $currentSort)
                    .presentationDetents([.medium, .fraction(0.45)])
//                    .presentationCornerRadius(28)
            }
            
            .sheet(isPresented: $showFilterTray){
                FilterView()
                    .presentationDetents([.large])
            }
            
        }
    }
}


struct SearchHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeaderView()
    }
}

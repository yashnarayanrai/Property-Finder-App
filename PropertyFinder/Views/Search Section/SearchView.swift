//
//  SearchView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        
        VStack{
            SearchHeaderView()
            
            ScrollView(.vertical, showsIndicators: false){
                PropertyListView()
                PropertyListView()
                
                HStack{
                    Text("Funded Properties")
                        .font(.title2)
                        .foregroundColor(Color.theme.black)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("See All")
                        .font(.title2)
                        .foregroundColor(Color.theme.primaryBlue)
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        PropertyListView()
                        PropertyListView()
                        PropertyListView()
                        PropertyListView()
                    }
                }
                
                PropertyListView()
            }
            Spacer()
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

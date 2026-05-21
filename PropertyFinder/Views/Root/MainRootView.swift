//
//  MainRootView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 11/05/26.
//

import SwiftUI

// Define Tab Bar
enum Tab: Int, CaseIterable {
    case home
    case search
    case activity
    case insights
    case account
    
    var title: String {
        switch self{
            case .home: return "Home"
            case .search: return "Search"
            case .activity: return "Activity"
            case .insights: return "Insights"
            case .account: return "Account"
        }
    }
    
    var icon: String {
        switch self{
            case .home: return "house.fill"
            case .search: return "magnifyingglass"
            case .activity: return "heart.fill"
            case .insights: return "newspaper.fill"
            case .account: return "person.crop.circle.fill"
        }
    }
}

struct MainRootView: View {
    @State private var selectedTab: Tab = .search
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            ForEach(Tab.allCases, id: \.self){ tab in
                getTabView(for: tab)
                    .tabItem{
                        Label(tab.title, systemImage: tab.icon)
                    }
                    .tag(tab)
            }
        }
        .tint(Color.theme.accent)

    }

    @ViewBuilder
    func getTabView(for tab: Tab) -> some View{
        switch tab{
        case .home:
            NavigationStack{
                HomeView()
            }
        case .search:
            NavigationStack{
                SearchView()
            }
        case .activity:
            NavigationStack{
                ActivityView()
            }
        case .insights:
            NavigationStack{
                InsightsView()
            }
        case .account:
            NavigationStack{
                AccountView()
            }
        }
    }
}

struct MainRootView_Previews: PreviewProvider {
    static var previews: some View {
        MainRootView()
    }
}

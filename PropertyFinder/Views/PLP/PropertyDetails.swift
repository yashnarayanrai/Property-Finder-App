//
//  PropertyDetails.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct PropertyDetails: View {
    
    @Environment(\.dismiss)
    var dismiss
    
    var body: some View {
            ScrollView(showsIndicators: false){            
                Group{
                    ImageComponent()
                    
                    ImageDetailComponent()
                    
                    FinancialRowDetailComponent()
                    
                    HowItWorkComponent()
                    
                    CapitalGrowthComponent()
                                        
                    InvestmentCalculatorComponent()
                    
                    LeasingStrategyComponent()
                    
                    FinancialsComponent()
                    
                    ExitOptions()
                }
                    
                    FundingTimelineComponent()
                    
                    WhyDubaiComponent()
                    
                    TheBuildingComponent()
                    
                    DocumentsComponent()
                    
                    StakeAcademyComponent()
                    
                    InvestButtonComponent()
                    
            }
            .background(Color.theme.backgroundBanner)
            .navigationBarHidden(true)
            .ignoresSafeArea(edges: .top)
    }
}

struct PropertyDetails_Previews: PreviewProvider {
    static var previews: some View {
        PropertyDetails()
    }
}

//
//  CalculatorView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 04/06/26.
//

import SwiftUI
import Charts

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatedViewModel()
        
    var body: some View {
        VStack(spacing: 16){
            
            howMoneyCouldGrowContent
            
            monthlyDeposite
            
            monthlyDepositeValues
            
            graphView
            
        }
        .foregroundColor(Color.theme.primaryText)
        .background(Color(UIColor.systemBackground))
    }
}

extension CalculatorView {
    
    private var howMoneyCouldGrowContent: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("How your money could grow")
                .font(.title3).bold()
            
            Text("Calculations assume monthly deposite, rental income investment, and projected appreciation.")
                .font(.subheadline)
                .fontWeight(.regular)
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
    
    private var monthlyDeposite: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Monthly deposits")
                .font(.subheadline)
                .fontWeight(.regular)
            
            HStack(spacing: 8){
                Button(action: {
                    viewModel.decreaseDepositValue()
                }){
                    Image(systemName: "minus")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryBlue)
                        .frame(width: 48, height: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.primaryBlue, lineWidth: 1))
                }
                
                
                Text("\(viewModel.monthlyDeposit) AED")
                    .font(.subheadline).bold()
                    .foregroundColor(Color.theme.black)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(Color.theme.white)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
                
                Button(action: { viewModel.increaseDepositValue()
                    
                }){
                    Image(systemName: "plus")
                        .font(.subheadline).bold()
                        .foregroundColor(Color.theme.primaryBlue)
                        .frame(width: 48, height: 48)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.theme.primaryBlue, lineWidth: 1))
                }
            }
        }
        .padding(16)
        .background(Color.theme.backgroundBanner)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
    
    private var monthlyDepositeValues: some View {
        VStack{
            HStack{
                Text("Proj. portfolio value in Y15")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                Spacer()
                
                Text("\(viewModel.projectedValue) AED")
                    .font(.subheadline).bold()
            }
            .padding(8)
            
            Divider()
            
            HStack{
                Text("Monthly income by Y15")
                    .font(.subheadline)
                    .fontWeight(.regular)
                
                Spacer()
                
                Text("\(viewModel.monthlyIncome) AED")
                    .font(.subheadline).bold()
            }
            .padding(8)
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
    
    private var graphView: some View {
        
        VStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 16){
                    HStack(spacing: 8){
                        HStack(spacing: 8){
                            Image(systemName: "circle.fill")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryBlue)
                            Text("Projection")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.1))
                        .clipShape(Capsule())
                        
                        HStack(spacing: 8){
                            Image(systemName: "circle.fill")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryBlue.opacity(0.5))
                            Text("Likely range")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .foregroundColor(Color.theme.primaryText)
                            
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.theme.gray.opacity(0.1))
                        .clipShape(Capsule())
                    }
                    
                    projectionChartView
                        
                    HStack(spacing: 12){
                        CapsuleButton(title: "15 years", iconName: "chevron.down"){}
                        
                        CapsuleButton(title: "6% net yield", iconName: "chevron.down"){}
                    }
                }
            }
            .padding(16)
            
            
            Divider()
            
            VStack{
                Text("Estimates shown are illustrative only and not a guarantee of future performance.")
            }
            .padding(16)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color.theme.gray.opacity(0.3), lineWidth: 1))
    }
}

extension CalculatorView {
    private var projectionChartView: some View{
        Chart {
            ForEach(viewModel.chartData) { item in
                AreaMark (x: .value("Year", item.year), yStart: .value("Min", item.lowerRange), yEnd: .value("Max", item.upparRange)
                )
                .foregroundStyle(Color.theme.primaryBlue.opacity(0.1))
            }
            
            ForEach(viewModel.chartData) { item in
                LineMark(
                    x: .value("Year", item.year),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(Color.theme.primaryBlue)
                .lineStyle(StrokeStyle(lineWidth: 3))
            }
            
            if let last = viewModel.chartData.last{
                PointMark( x: .value("Year", last.year),
                           y: .value("Value", last.value)
                )
                .foregroundStyle(Color.theme.primaryBlue)
                .symbolSize(120)
            }
        }
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(data: [
            .init(year: 1, value: 24000, lowerRange: 22000, upparRange: 26000),
            .init(year: 5, value: 42000, lowerRange: 38000, upparRange: 47000),
            .init(year: 10, value: 60000, lowerRange: 52000, upparRange: 70000),
            .init(year: 15, value: 78000, lowerRange: 68000, upparRange: 92000)
        ])
    }
}

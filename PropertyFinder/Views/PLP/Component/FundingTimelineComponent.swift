//
//  FundingTimelineComponent.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 20/05/26.
//

import SwiftUI

struct TimelineStep: Identifiable {
    let id = UUID()
    let dateString: String
    let title: String
    let description: String
    let isCompleted: Bool
    let isActiveCurrent: Bool
}

struct FundingTimelineComponent: View {
    
    let steps = [
        TimelineStep(
            dateString: "25 Nov 2025",
            title: "Latest funding date",
            description: "This is a conservative estimate for the closing date of the property funding.",
            isCompleted: true,
            isActiveCurrent: false
        ),
        TimelineStep(
            dateString: "25 Dec 2025",
            title: "Share certificates issued",
            description: "Property Share Certificates will be issued in 2 weeks after the property is funded.",
            isCompleted: true,
            isActiveCurrent: false
        ),
        TimelineStep(
            dateString: "30 May 2026", // Today's date live matching current context tracking parameters
            title: "First guaranteed rental payment",
            description: "First rent payment expected by 1 May 2026 and guaranteed no later than 30 May 2026.",
            isCompleted: false,
            isActiveCurrent: true
        )
    ]
    
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            Text("Funding timeline")
                .font(.title3).bold()
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<steps.count, id: \.self) { index in
                    let step = steps[index]
                    
                    HStack(alignment: .top, spacing: 12) {
                        
                        // LEFT COLUMN: Node circle markers and connection paths
                        VStack(spacing: 0) {
                            TimelineIndicatorNode(isCompleted: step.isCompleted, isActive: step.isActiveCurrent)
                            
                            // Draw continuous connector lines till the second last block index item
                            if index != steps.count - 1 {
                                Rectangle()
                                    .fill(Color.theme.gray.opacity(0.2))
                                    .frame(width: 1)
                                    .frame(minHeight: 60) // Dynamic frame spacing gap matching content details height
                            }
                            
                        }
                        
                        // RIGHT COLUMN: Content Metadata Block Information
                        VStack(alignment: .leading, spacing: 8) {
                            // Capsule Date String Marker Tag Component Layout
                            Text(step.dateString)
                                .font(.caption)
                                .fontWeight(.medium)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 6)
                                .background(Color(.systemGray6))
                                .foregroundColor(Color.theme.black)
                                .clipShape(Capsule())
                            Text(step.title)
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor(Color.theme.black)
                            
                            // Descriptions Content Info Truncating Fixed
                            Text(step.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineSpacing(4)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.bottom, index == steps.count - 1 ? 0 : 24) // Spacing parameters between milestones steps
                    }
                }
            }
            .padding(.leading, 4)
            
            
            //            VStack(spacing: 16){
            //                ForEach(0..<steps.count, id: \.self) { index in
            //                    let step = steps[index]
            //                }
            //
            //                HStack(spacing: 12){
            //                    VStack{
            //                        TimelineIndicatorNode(isCompleted: step.isCompleted, isActive: step.isActiveCurrent)
            //
            //                        // Draw continuous connector lines till the second last block index item
            //                        if index != steps.count - 1 {
            //                            Rectangle()
            //                                .fill(Color.gray.opacity(0.2))
            //                                .frame(width: 1)
            //                                .frame(minHeight: 60) // Dynamic frame spacing gap matching content details height
            //                        }
            //
            //                    }
            //
            ////                    VStack(alignment: .leading, spacing:12){
            ////                        VStack(alignment: .leading){
            ////                            Text("Latest funding set")
            ////                                .font(.body).bold()
            ////                                .foregroundColor(Color.theme.primaryText)
            ////                            Text("This is conservativeestimate for the closing date of the property funding.")
            ////                                .font(.subheadline)
            ////                                .fontWeight(.regular)
            ////                                .foregroundColor(Color.theme.secondaryText)
            ////                        }
            ////                    }
            //                }
            //
            //                HStack(spacing: 12){
            //
            //                }
            //
            //                HStack(spacing: 12){
            //
            //                }
            //            }
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
    }
}

struct TimelineIndicatorNode: View {
    let isCompleted: Bool
    let isActive: Bool
    
    var body: some View {
        Group {
            if isActive {
                // Current Target State: Gradient style background with red verification overlay checkmarks
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 32, height: 32)
                    Image("SuccessCheck")
                        
                }
            } else if isCompleted {
                // Past Completed State: Subtle clean generic background with purple ticks
                ZStack {
                    Circle()
                        .fill(Color.purple.opacity(0.06))
                        .frame(width: 32, height: 32)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.purple)
                }
            } else {
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: 32, height: 32)
            }
        }
    }
}

struct FundingTimelineComponent_Previews: PreviewProvider {
    static var previews: some View {
        FundingTimelineComponent()
    }
}

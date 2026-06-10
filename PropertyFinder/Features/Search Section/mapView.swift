//
//  mapView.swift
//  PropertyFinder
//
//  Created by Anand Narayan Rai on 22/05/26.
//

import SwiftUI
import MapKit

struct mapView: View {
    var body: some View {
        VStack {
            
            Map(coordinateRegion: .constant(region))
                .frame(height: 300)
            
            Image("propertyImage")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                
                Text("Hello")
                
                Image("Warning")
            }
        }
    }
    
    private var region: MKCoordinateRegion{
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.2155, longitude: 83.0279),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}

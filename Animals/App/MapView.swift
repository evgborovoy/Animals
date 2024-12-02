//
//  MapView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Properties
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
            span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        )
    )
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(locations) { location in
                Annotation("", coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
    }
}



#Preview {
    MapView()
}

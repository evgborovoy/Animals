//
//  MainView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Body
    var body: some View {
        TabView {
            Tab("Browse", systemImage: "square.grid.2x2") {
                ContentView()
            }
            
            Tab("Watch", systemImage: "play.rectangle") {
                VideoListView()
            }
            
            Tab("Locations", systemImage: "map") {
                MapView()
            }
            
            Tab("Gallery", systemImage: "photo") {
                GalleryView()
            }
        }
    }
}

#Preview {
    MainView()
}

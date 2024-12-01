//
//  AnimalDetailView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // Image
            Image(animal.image)
                .resizable()
                .scaledToFit()
            
            // Title
            Text(animal.name.uppercased())
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.vertical, 8)
                .foregroundStyle(.primary)
                .background(
                    Color.accentColor
                        .frame(height: 6)
                        .offset(y: 24)
                )
            
            // Headline
            Text(animal.headline)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.accent)
                .padding(.horizontal)
                .padding(.top, 8)
            
            // Gallery
            Group {
                HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                
                InsetGalleryView(images: animal.gallery)
                
                // Facts
                HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                
                InsetFactView(animal: animal)
                
                // Description
                HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                
                Text(animal.description)
                    .multilineTextAlignment(.leading)
                    .layoutPriority(1)
                
                // Map
                HeadingView(headingImage: "map", headingText: "National Parks")
                
                InsetMapView()
                
                // Link
                HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                
                ExternalWeblinkView(animal: animal)
            }
            .padding(.horizontal)
            
        }
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    NavigationStack {
        AnimalDetailView(animal: animals[3])
    }
}

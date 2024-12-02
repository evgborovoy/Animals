//
//  GalleryView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(.white, lineWidth: 8))
                    
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) {
                        withAnimation(.easeInOut(duration: 0.6)) {
                            gridSwitch()
                        }
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                            }
                    }
                }
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}

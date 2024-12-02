//
//  ContentView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIconGrid: String = "square.grid.2x2"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    func switchGrid() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolBarIconGrid = "square.grid.2x2"
        case 2:
            toolBarIconGrid = "square.grid.3x2"
        default:
            toolBarIconGrid = "rectangle.grid.1x2"
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        // List view
                        Button {
                            withAnimation(.easeIn) {
                                isGridViewActive = false
                            }
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        }
            
                        // Grid view
                        Button {
                            withAnimation(.easeIn) {
                                isGridViewActive = true
                                switchGrid()
                            }
                        } label: {
                            Image(systemName: toolBarIconGrid)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

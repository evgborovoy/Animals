//
//  CoverImageView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 11/30/24.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { coverImage in
                Image(coverImage.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}

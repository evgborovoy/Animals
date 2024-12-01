//
//  InsetGalleryView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - Property
    let images: [String]
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}


#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    InsetGalleryView(images: animals[1].gallery)
}

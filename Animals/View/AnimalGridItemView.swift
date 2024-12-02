//
//  AnimalGridItemView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/2/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - Properties
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    AnimalGridItemView(animal: animals.first!)
}

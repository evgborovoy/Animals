//
//  AnimalModel.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
    
}

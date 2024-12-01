//
//  VideoModel.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/1/24.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

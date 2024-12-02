//
//  CenterModifier.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/3/24.
//

import SwiftUI

struct centerModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

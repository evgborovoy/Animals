//
//  CreditsView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/3/24.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Be a nice ♡
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.5)
    }
}

#Preview {
    CreditsView()
}

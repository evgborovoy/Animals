//
//  MotionAnimationView.swift
//  Animals
//
//  Created by Evgeniy Borovoy on 12/2/24.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // MARK: - Functions
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...1.9)
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.02...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize())
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        ).animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()), value: isAnimating)
                        .onAppear {
                            withAnimation() {
                                isAnimating = true
                            }
                        }
                }
                .drawingGroup()
            }
        }
    }
}

#Preview {
    MotionAnimationView()
}

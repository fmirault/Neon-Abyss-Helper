// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct Shadow: ViewModifier {
    
    let color: Color
    let radius: CGFloat
    
    init(color: Color, radius: CGFloat) {
        self.color = color
        self.radius = radius
    }
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius, x: 2, y: 2)
    }
}

extension View {
    
    func shadow(color: Color = .black, opacity: Double = 0.5, radius: CGFloat = 5.0) -> some View {
        modifier(Shadow(color: color.opacity(opacity), radius: radius))
    }
    
}

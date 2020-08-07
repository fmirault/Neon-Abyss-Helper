// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct RadialBackground: ViewModifier {
    
    let colors: [Color]
    let startRadius: CGFloat
    let endRadius: CGFloat
    
    init(colors: [Color], startRadius: CGFloat, endRadius: CGFloat) {
        self.colors = colors
        self.startRadius = startRadius
        self.endRadius = endRadius
    }
    
    func body(content: Content) -> some View {
        content
            .background(RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: startRadius, endRadius: endRadius))
    }
}

extension View {
    
    func radialBackground(colors: [Color] = [Color.pinkNeon, Color.blueNeon],
                          startRadius: CGFloat = 5.0,
                          endRadius: CGFloat = 150.0) -> some View {
        modifier(RadialBackground(colors: colors, startRadius: startRadius, endRadius: endRadius))
    }
    
}

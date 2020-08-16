// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

extension View {
    func radialBackground(colors: [Color] = [Color.pinkNeon, Color.blueNeon],
                          startRadius: CGFloat = 5.0,
                          endRadius: CGFloat = 150.0) -> some View {
        background(
            RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: startRadius, endRadius: endRadius)
        )
    }
}

extension Rectangle {
    func radialBackground(colors: [Color] = [Color.pinkNeon, Color.blueNeon],
                          startRadius: CGFloat = 5.0,
                          endRadius: CGFloat = 150.0) -> some View {
        fill(
            RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: startRadius, endRadius: endRadius)
        )
    }
}

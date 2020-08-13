// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct RoundedBarButtonStyle: ButtonStyle {
    
    init() { }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(AppConfig.Design.Margins.small)
            .foregroundColor(Color.label)
            .frame(width: 40.0, height: 40.0)
            .background(RoundedRectangle(cornerRadius: 50).foregroundColor(Color.accentColor))
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
            .animation(.interactiveSpring())
    }
}

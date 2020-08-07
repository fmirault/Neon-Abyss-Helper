// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

extension Image {
    
    func applyImageStyle() -> some View {
        renderingMode(.original)
            .resizable()
            .padding(AppConfig.Design.Margins.medium)
            .scaledToFit()
            .frame(width: 80, height: 80)
            .shadow()
            .radialBackground()
            .cornerRadius(AppConfig.Design.CornerRadius.small)
    }
    
}

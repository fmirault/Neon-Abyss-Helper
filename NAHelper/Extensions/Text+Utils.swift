// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

extension Text {
    
    func applyCardTitle() -> some View {
        font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.greyText)
    }
    
    func applyCardDescription() -> some View {
        font(.caption)
            .foregroundColor(Color.secondaryLabel)
    }
    
    func applyCardTag() -> some View {
        font(.caption2)
            .foregroundColor(Color.greyText)
    }
    
}

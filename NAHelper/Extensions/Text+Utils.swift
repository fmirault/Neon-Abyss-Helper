// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

extension Text {
    
    func applyCardTitle() -> some View {
        font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.darkText)
            .lineLimit(2)
    }
    
    func applyCardDescription() -> some View {
        font(.caption)
            .foregroundColor(Color.secondaryLabel)
            .lineLimit(2)
            
    }
    
}

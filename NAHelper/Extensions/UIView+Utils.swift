// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

extension View {
    
    func fullWidth(alignment: Alignment = .topLeading) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
}

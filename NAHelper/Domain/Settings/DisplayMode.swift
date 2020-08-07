// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation

enum DisplayMode: Int, CaseIterable {
    case list, cards, grid
    
    var iconName: String {
        switch self {
        case .list: return "rectangle.grid.2x2.fill"
        case .cards: return "rectangle.grid.3x2.fill"
        case .grid: return "rectangle.grid.1x2.fill"
        }
    }
}

// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation

enum SortingMode: String, CaseIterable {
    case id, name, color
    
    var title: String {
        switch self {
        case .id: return "By ID"
        case .name: return "By name"
        case .color: return "By color"
        }
    }
    
    var iconName: String {
        switch self {
        case .id: return "tag.fill"
        case .name: return "book.fill"
        case .color: return "eyedropper.halffull"
        }
    }
}

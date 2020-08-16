// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation

enum SortingMode: String, CaseIterable {
    case id, name, type, color
    
    var title: String {
        switch self {
        case .id: return "By ID"
        case .name: return "By name"
        case .type: return "By type"
        case .color: return "By color"
        }
    }
    
    var iconName: String {
        switch self {
        case .id: return "tag.fill"
        case .name: return "book.fill"
        case .type: return "wrench.fill"
        case .color: return "paintbrush.fill"
        }
    }
}

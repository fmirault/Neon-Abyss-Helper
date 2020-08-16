// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct SortingModePreferenceKey: PreferenceKey {
    static var defaultValue: SortingMode = .id
    
    static func reduce(value: inout SortingMode, nextValue: () -> SortingMode) {
        value = nextValue()
    }
}

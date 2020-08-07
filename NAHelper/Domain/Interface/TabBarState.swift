// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation
import SwiftUI

class TabBarState: ObservableObject {
    enum Tab: Int {
        case characters, items, weapons
    }
    
    @Published var selectedTab = Tab.items
}

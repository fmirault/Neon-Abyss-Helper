// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation
import Combine
import SwiftUI

class AppUserDefaults: ObservableObject {
    
    @AppStorage("preferredDisplayMode")
    var preferredDisplayMode: DisplayMode = .list {
        willSet {
            objectWillChange.send()
        }
    }
    
}


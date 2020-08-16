// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation

extension Array where Element: Equatable {

    mutating func replace(_ element: Element, with anotherElement: Element) {
        if let index = firstIndex(of: element) {
            self[index] = anotherElement
        }
    }
}

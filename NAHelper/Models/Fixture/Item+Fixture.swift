// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation

#if DEBUG
extension Item {
    enum Fixture {
        static var brocoli: Item {
            Item(description: "Broccolis are so good...", image: "Broccoli", name: "Broccoli", slug: "broccoli", tags: ["item","player-stat"])
        }
        
        static func make(id: UUID = UUID(), description: String, name: String, image: String, slug: String, tags: [String]) -> Item {
            Item(id: id, description: description, image: image, name: name, slug: slug, tags: tags)
        }
    }
}

typealias 🧬 = Item.Fixture

#endif

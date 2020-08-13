// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct Item: Codable, Equatable, Identifiable, Hashable {
    var id: UUID = UUID()
    let description: String
    let image: String
    let name: String
    let slug: String
    let colorOrder: String
    let tags: [String]
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    private enum CodingKeys : String, CodingKey {
        case description, image, name, slug, tags, colorOrder
    }
}

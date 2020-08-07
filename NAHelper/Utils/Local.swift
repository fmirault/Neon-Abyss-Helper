// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct LocalFile {
  
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var image: Image {
        if UIImage(named: name) != nil {
            return Image(name)
        } else {
            return Image(systemName: "questionmark.square")
        }
    }
    
}

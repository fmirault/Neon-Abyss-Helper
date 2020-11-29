// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemGridView: View {
    
    let namespace: Namespace.ID
    var item: Item
    
    var body: some View {
        LocalFile(item.image).image
            .applyImageStyle()
            .shadow(opacity: 0.2)
            .drawingGroup()
    }
}

#if DEBUG
struct ItemGridView_Previews: PreviewProvider {
    @Namespace private static var namespace
    static var previews: some View {
        UIElementPreview(ItemGridView(namespace: namespace, item: 🧬.brocoli))
    }
}
#endif

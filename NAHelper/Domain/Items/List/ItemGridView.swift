// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemGridView: View {
    
    let namespace: Namespace.ID
    var item: Item
    
    var body: some View {
        LocalFile(item.image).image
            .applyImageStyle()
            .shadow(opacity: 0.2)
            .matchedGeometryEffect(id: item.name, in: namespace)
    }
}

#if DEBUG
struct ItemGridView_Previews: PreviewProvider {
    @Namespace private static var namespace
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemGridView(namespace: namespace, item: 🧬.brocoli)
                    .previewLayout(.sizeThatFits)
                    .padding()
                    .preferredColorScheme(colorScheme)
                    .previewDevice(PreviewDevice(rawValue: devicesName))
                    .previewDisplayName(devicesName)
            }
        }
    }
}
#endif

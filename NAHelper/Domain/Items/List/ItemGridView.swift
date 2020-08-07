// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemGridView: View {
    
    var item: Item
    
    var body: some View {
        LocalFile(item.image).image
            .applyImageStyle()
            .shadow(opacity: 0.2)
    }
}

#if DEBUG
struct ItemGridView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemGridView(item: 🧬.brocoli)
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

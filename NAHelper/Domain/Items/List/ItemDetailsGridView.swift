// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemDetailsGridView: View {
    
    var item: Item
    
    var body: some View {
        LocalFile(item.image).image
            .resizable()
            .padding(AppConfig.Design.Margins.veryVerySmall)
            .scaledToFit()
            .frame(width: 40, height: 40)
            .shadow(opacity: 0.2)
            .background(Color.secondarySystemBackground)
            .cornerRadius(AppConfig.Design.CornerRadius.small)
            .drawingGroup()
    }
}

#if DEBUG
struct ItemDetailsGridView_Previews: PreviewProvider {
    @Namespace private static var namespace
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemDetailsGridView(item: 🧬.sashimiSushi)
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

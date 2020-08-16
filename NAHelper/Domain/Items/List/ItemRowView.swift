// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemRowView: View {
    
    let namespace: Namespace.ID
    var item: Item
    
    var body: some View {
        HStack(spacing: AppConfig.Design.Margins.medium) {
            LocalFile(item.image).image
                .applyImageStyle()
                .matchedGeometryEffect(id: item.name, in: namespace)
            
            titleAndDescription
        }
        .fullWidth()
        .padding(AppConfig.Design.Margins.medium)
        .background(Color.secondarySystemBackground)
        .cornerRadius(AppConfig.Design.CornerRadius.medium)
        .shadow(opacity: 0.1)
    }
    
    // MARK: - Private
    
    private var titleAndDescription: some View {
        VStack(alignment: .leading, spacing: AppConfig.Design.Margins.verySmall) {
            Text(item.name)
                .applyCardTitle()
                .lineLimit(2)
            
            Text(item.description)
                .applyCardDescription()
                .lineLimit(2)
        }
    }
    
}

#if DEBUG
struct ItemRowView_Previews: PreviewProvider {
    @Namespace private static var namespace
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemRowView(namespace: namespace, item: 🧬.brocoli)
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

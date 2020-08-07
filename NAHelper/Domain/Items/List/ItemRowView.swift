// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemRowView: View {
    
    var item: Item
    
    var body: some View {
        HStack(spacing: AppConfig.Design.Margins.medium) {
            LocalFile(item.image).image.applyImageStyle()
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
            Text(item.name).applyCardTitle()
            Text(item.description).applyCardDescription()
        }
    }
    
}

#if DEBUG
struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemRowView(item: 🧬.brocoli)
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

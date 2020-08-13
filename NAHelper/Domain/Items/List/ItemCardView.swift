// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemCardView: View {
    
    let namespace: Namespace.ID
    var item: Item
    
    var body: some View {
        ZStack {
            VStack(spacing: AppConfig.Design.Margins.verySmall) {
                pictureAndTitle
                descriptionLabel
            }
            .padding(AppConfig.Design.Margins.medium)
        }
        .background(Color.secondarySystemBackground)
        .cornerRadius(AppConfig.Design.CornerRadius.medium)
        .shadow(opacity: 0.1)
    }
    
    // MARK: - Private
    
    private var pictureAndTitle: some View {
        VStack(spacing: AppConfig.Design.Margins.medium) {
            LocalFile(item.image).image
                .applyImageStyle()
                .matchedGeometryEffect(id: item.name, in: namespace)
            
            Text(item.name)
                .applyCardTitle()
                .multilineTextAlignment(.center)
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
    
    private var descriptionLabel: some View {
        Text(item.description)
            .applyCardDescription()
            .multilineTextAlignment(.center)
    }
    
}

#if DEBUG
struct ItemCardView_Previews: PreviewProvider {
    @Namespace private static var namespace
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemCardView(namespace: namespace, item: 🧬.brocoli)
                    .previewLayout(.fixed(width: 200, height: 250))
                    .padding()
                    .preferredColorScheme(colorScheme)
                    .previewDevice(PreviewDevice(rawValue: devicesName))
                    .previewDisplayName(devicesName)
            }
        }
    }
}
#endif

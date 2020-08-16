// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemDetailsView: View {
    
    // MARK: - Properties
    
    @State var item: Item
    @State var associatedItems: [Item]
    @State private var waveEffect = false
    @State private var presentedSheet: Sheet.SheetType?
    
    // MARK: - LifeCycle
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: AppConfig.Design.Margins.verySmall) {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 350)
                            .overlay(
                                RadialGradient(gradient: Gradient(colors: [Color.pinkNeon, Color.blueNeon]), center: .center, startRadius: 5, endRadius: 525)
                            )
                        
                        LocalFile(item.image).image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .scaleEffect(waveEffect ? 1.1 : 1.0)
                            .animation(Animation.easeInOut(duration: 2.0).repeatForever())
                            .onAppear(perform: { waveEffect.toggle() })
                        
                        HStack(spacing: AppConfig.Design.Margins.small) {
                            ForEach(item.tags, id: \.self) {
                                Text($0)
                                    .applyCardTag()
                                    .frame(alignment: .bottomTrailing)
                                    .padding(AppConfig.Design.Margins.verySmall)
                                    .background(Color.secondarySystemBackground)
                                    .cornerRadius(AppConfig.Design.CornerRadius.medium)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(AppConfig.Design.Margins.verySmall)
                    }
                    VStack(alignment: .leading, spacing: AppConfig.Design.Margins.verySmall) {
                        Text(item.name)
                            .applyCardTitle()
                        
                        Text(item.description)
                            .applyCardDescription()
                    }
                    .padding(AppConfig.Design.Margins.medium)
                    
                    VStack(alignment: .leading, spacing: AppConfig.Design.Margins.verySmall) {
                        let columns = [GridItem(.adaptive(minimum: 40), spacing: AppConfig.Design.Margins.small)]
                        Text("Same type items").applyCardTitle()
                        LazyVGrid(columns: columns, spacing: AppConfig.Design.Margins.medium) {
                            ForEach(associatedItems) { item in
                                ItemDetailsGridView(item: item)
                                    .onTapGesture {
                                        self.associatedItems.replace(item, with: self.item)
                                        self.item = item
                                    }
                            }
                        }
                        .padding(.horizontal, AppConfig.Design.Margins.medium)
                    }
                    .padding(AppConfig.Design.Margins.medium)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(item: $presentedSheet, content: { Sheet(sheetType: $0) })
    }
    
}

#if DEBUG
struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ItemDetailsView(item: 🧬.brocoli, associatedItems: [🧬.sashimiSushi])
                    .preferredColorScheme(colorScheme)
                    .previewDevice(PreviewDevice(rawValue: devicesName))
                    .previewDisplayName(devicesName)
            }
        }
    }
}
#endif

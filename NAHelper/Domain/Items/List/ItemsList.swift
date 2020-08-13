// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct ItemsList: View {
    
    @Namespace private var itemsNamespace
    @StateObject private var viewModel = ItemsListViewModel()
    @EnvironmentObject var appUserDefaults: AppUserDefaults
    
    var body: some View {
        NavigationView {
            contentView
                .navigationBarTitle(Text(L10n.TabBar.items))
                .navigationBarItems(trailing: trailingDisplayButton)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {

        ScrollView {
            switch appUserDefaults.preferredDisplayMode {
            case .grid: gridView
            case .list: listView
            case .cards: cardsView
            }
        }
    }
    
    // MARK: - Private
    
    private var trailingDisplayButton: some View {
        Button(action: {
            switch appUserDefaults.preferredDisplayMode {
            case .list: appUserDefaults.preferredDisplayMode = .cards
            case .cards: appUserDefaults.preferredDisplayMode = .grid
            case .grid: appUserDefaults.preferredDisplayMode = .list
            }
        }) {
            Image(systemName: appUserDefaults.preferredDisplayMode.iconName)
        }
        .buttonStyle(RoundedBarButtonStyle())
        .accentColor(.secondarySystemBackground)
    }
    
    private var gridView: some View {
        let columns = [GridItem(.adaptive(minimum: 80, maximum: 120), spacing: AppConfig.Design.Margins.medium)]
        
        return LazyVGrid(columns: columns, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.items) { ItemGridView(namespace: itemsNamespace, item: $0) }
        }
        .padding(.horizontal, AppConfig.Design.Margins.medium)
    }
    
    private var listView: some View {
        LazyVStack(alignment: .leading, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.items) { ItemRowView(namespace: itemsNamespace, item: $0) }
        }
        .padding(.horizontal, AppConfig.Design.Margins.medium)
    }
    
    private var cardsView: some View {
        let columns = [GridItem(.flexible(), spacing: AppConfig.Design.Margins.medium), GridItem(.flexible(), spacing: AppConfig.Design.Margins.medium)]
        
        return LazyVGrid(columns: columns, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.items) { ItemCardView(namespace: itemsNamespace, item: $0) }
        }
        .padding(.horizontal, AppConfig.Design.Margins.medium)
    }
    
}

#if DEBUG
struct ItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([AllDeviceNames.iPhone11.rawValue], id: \.self) { devicesName in
            ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
                ForEach(DisplayMode.allCases, id: \.self) { displayMode in
                    ItemsList()
                        .environmentObject({ () -> AppUserDefaults in
                            let appUserDefaults = AppUserDefaults()
                            appUserDefaults.preferredDisplayMode = displayMode
                            return appUserDefaults
                        }())
                        .preferredColorScheme(colorScheme)
                        .previewDevice(PreviewDevice(rawValue: devicesName))
                        .previewDisplayName(devicesName)
                }
            }
        }
    }
}
#endif

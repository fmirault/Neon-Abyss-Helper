// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

enum ListContentMode {
    case list
    case details
}

struct ItemsList: View {
    
    @Namespace private var itemsNamespace
    @EnvironmentObject var appUserDefaults: AppUserDefaults
    @StateObject private var viewModel = ItemsListViewModel()
    @State private var presentedSheet: Sheet.SheetType?
    
    var body: some View {
        NavigationView {
            contentView
                .navigationBarTitle(Text(L10n.TabBar.items))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: AppConfig.Design.Margins.medium) {
                            sortMenuButton
                            displayModeButton
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        GeometryReader { geometry in
            ScrollView {
                switch appUserDefaults.preferredDisplayMode {
                case .grid: gridView
                case .list: listView
                case .cards: cardsView
                }
            }
            .preference(key: SortingModePreferenceKey.self, value: appUserDefaults.preferredSortingMode)
            .onPreferenceChange(SortingModePreferenceKey.self) { viewModel.sort = $0 }
            .sheet(item: $presentedSheet, content: { Sheet(sheetType: $0) })
        }
    }
    
    // MARK: - Private
    
    private var sortMenuButton: some View {
        Menu {
            Picker(selection: $appUserDefaults.preferredSortingMode, label: Text("Sorting options")) {
                ForEach(SortingMode.allCases, id: \.self) {
                    Label($0.title, systemImage: $0.iconName).tag($0.rawValue)
                }
            }
        }
        label: {
            Button(action: { }) { Image(systemName: "tray.full.fill") }
                .accentColor(.secondarySystemBackground)
                .buttonStyle(RoundedBarButtonStyle())
        }
    }
    
    private var displayModeButton: some View {
        Button(action: {
            switch appUserDefaults.preferredDisplayMode {
            case .list: appUserDefaults.preferredDisplayMode = .cards
            case .cards: appUserDefaults.preferredDisplayMode = .grid
            case .grid: appUserDefaults.preferredDisplayMode = .list
            }
        }) {
            Image(systemName: appUserDefaults.preferredDisplayMode.iconName)
        }
        .accentColor(.secondarySystemBackground)
        .buttonStyle(RoundedBarButtonStyle())
    }
    
    private var gridView: some View {
        let columns = [GridItem(.adaptive(minimum: 80, maximum: 120), spacing: AppConfig.Design.Margins.medium)]
        
        return LazyVGrid(columns: columns, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.sortedItems) { item in
                ItemGridView(namespace: itemsNamespace, item: item)
                    .onTapGesture {
                        presentedSheet = .itemDetails(item: item, associatedItems: viewModel.associatedObjects(item))
                    }
            }
        }
        .padding(.horizontal, AppConfig.Design.Margins.medium)
    }
    
    private var listView: some View {
        LazyVStack(alignment: .leading, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.sortedItems) { item in
                ItemRowView(namespace: itemsNamespace, item: item)
                    .onTapGesture {
                        presentedSheet = .itemDetails(item: item, associatedItems: viewModel.associatedObjects(item))
                    }
            }
        }
        .padding(.horizontal, AppConfig.Design.Margins.medium)
    }
    
    private var cardsView: some View {
        let columns = [GridItem(.flexible(), spacing: AppConfig.Design.Margins.medium), GridItem(.flexible(), spacing: AppConfig.Design.Margins.medium)]
        
        return LazyVGrid(columns: columns, spacing: AppConfig.Design.Margins.medium) {
            ForEach(viewModel.sortedItems) { item in
                ItemCardView(namespace: itemsNamespace, item: item)
                    .onTapGesture {
                        presentedSheet = .itemDetails(item: item, associatedItems: viewModel.associatedObjects(item))
                    }
            }
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

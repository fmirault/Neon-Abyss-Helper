// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject private var tabBarState: TabBarState
    
    var body: some View {
        TabView(selection: $tabBarState.selectedTab) {
            CharactersList()
                .tabItem {
                    Assets.TabBar.characters
                    Text(L10n.TabBar.characters)
                }
                .tag(TabBarState.Tab.characters)

            ItemsList()
                .tabItem {
                    Assets.TabBar.items
                    Text(L10n.TabBar.items)
            }
                .tag(TabBarState.Tab.items)
            
            WeaponsList()
                .tabItem {
                    Assets.TabBar.weapons
                    Text(L10n.TabBar.weapons)
                }
                .tag(TabBarState.Tab.weapons)
        }
        .accentColor(.secondaryLabel)
    }
}

// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

@main
struct NAHelperApp: App {
    
    @StateObject private var tabBarState = TabBarState()
    @StateObject private var appUserDefaults = AppUserDefaults()
    
    var body: some Scene {
        WindowGroup {
            contentView
        }
    }
    
    private var contentView: some View {
        TabBarView()
            .environmentObject(tabBarState)
            .environmentObject(appUserDefaults)
            .onAppear(perform: {
                Design.setupAppearance()
            })
    }
    
}

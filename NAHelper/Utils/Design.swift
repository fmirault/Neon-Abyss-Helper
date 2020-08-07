// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct Design {
    
    static func setupAppearance() {
        let tabBarAppearence = UITabBar.appearance()
        tabBarAppearence.shadowImage = #imageLiteral(resourceName: "TabBarShadow")
        tabBarAppearence.backgroundImage = UIImage()
        tabBarAppearence.isTranslucent = true
        tabBarAppearence.backgroundColor = .systemBackground
        tabBarAppearence.unselectedItemTintColor = .tertiaryLabel
        
        let navigationBarAppearence = UINavigationBar.appearance()
        navigationBarAppearence.barTintColor = .systemBackground
        navigationBarAppearence.isTranslucent = true
        navigationBarAppearence.tintColor = UIColor.darkText
        
        guard let largeFontDescriptor = UIFontDescriptor
                .preferredFontDescriptor(withTextStyle: .title1)
                .withSymbolicTraits(.traitBold)?
                .withDesign(.rounded),
              let titleFontDescriptor = UIFontDescriptor
                .preferredFontDescriptor(withTextStyle: .largeTitle)
                .withSymbolicTraits(.traitBold)?
                .withDesign(.rounded) else { return }

        navigationBarAppearence.largeTitleTextAttributes = [
            NSAttributedString.Key.font:UIFont.init(descriptor: largeFontDescriptor, size: 36),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]

        navigationBarAppearence.titleTextAttributes = [
            NSAttributedString.Key.font:UIFont.init(descriptor: titleFontDescriptor, size: 20),
            NSAttributedString.Key.foregroundColor: UIColor.darkText
        ]
    }
    
}

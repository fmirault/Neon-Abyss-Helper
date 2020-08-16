// Copyright © Neon Abyss Explorer. All rights reserved.

import SwiftUI

struct Sheet: View {
    enum SheetType: Identifiable {
        case itemDetails(item: Item, associatedItems: [Item])
        
        var id: String {
            switch self {
            case .itemDetails:
                return "itemDetails"
            }
        }
    }
    
    let sheetType: SheetType
    
    @ViewBuilder
    var body: some View {
        switch sheetType {
        case let .itemDetails(item, associatedItems):
            ItemDetailsView(item: item, associatedItems: associatedItems)
        }
    }
}

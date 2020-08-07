// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation
import Combine

protocol ItemsListViewModelType: ObservableObject {
    var items: [Item] { get }
}

class ItemsListViewModel: ItemsListViewModelType {
    
    @Published var items: [Item] = []
    
    init() {
        loadData()
    }
    
    private func loadData() {
        let url = Bundle.main.url(forResource: "items_fr", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let elements = try? decoder.decode([Item].self, from: data)
        
        items = elements ?? []
    }
    
}

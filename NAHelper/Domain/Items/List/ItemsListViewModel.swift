// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation
import Combine

class ItemsListViewModel: ObservableObject {
    
    private var items: [Item] = []
    
    @Published var sortedItems: [Item] = []
    @Published var sort: SortingMode? {
        didSet {
            guard let sort = sort else { return }
            switch sort {
            case .id: sortedItems = items
            case .name: sortedItems = items.sorted { $0.name < $1.name }
            case .color: sortedItems = items.sorted { $0.colorOrder < $1.colorOrder }
            }
        }
    }
    
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

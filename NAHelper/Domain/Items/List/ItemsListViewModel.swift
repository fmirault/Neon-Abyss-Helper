// Copyright © Neon Abyss Explorer. All rights reserved.

import Foundation
import Combine

class ItemsListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var sortedItems: [Item] = []
    
    private var items: [Item] = [] {
        didSet { refreshItems() }
    }
    
    var sort: SortingMode = .id {
        didSet { refreshItems() }
    }
    
    // MARK: - LifeCycle
    
    init() {
        loadData()
    }
    
    // MARK : - Public
    
    func associatedObjects(_ item: Item) -> [Item] {
        return items.filter { item.tags.intersects(with: $0.tags) && $0 != item }
    }
    
    // MARK : - Private
    
    private func loadData() {
        let url = Bundle.main.url(forResource: "items_fr", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        let elements = try? decoder.decode([Item].self, from: data)

        items = elements ?? []
    }
    
    private func refreshItems() {
        switch sort {
        case .id: sortedItems = items
        case .name: sortedItems = items.sorted { $0.name < $1.name }
        case .type: sortedItems = items.sorted { ($0.tags.first ?? "") < ($1.tags.first ?? "") }
        case .color: sortedItems = items.sorted { $0.colorOrder < $1.colorOrder }
        }
    }
    
}

extension Sequence where Element: Hashable {
    func intersects<S : Sequence>(with sequence: S) -> Bool where S.Iterator.Element == Iterator.Element {
        contains(where: Set(sequence).contains)
    }
}

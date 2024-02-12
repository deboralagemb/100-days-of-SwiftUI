//
//  ListView.swift
//  iExpense
//
//  Created by Débora Lage on 12/02/24.
//

import SwiftData
import SwiftUI

struct ListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    
    var body: some View {
        List {
            Section {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text(item.amount, format: .currency(code: localCurrency))
                            AmountIconView(amount: item.amount)
                        }
                        
                    }
                }
                .onDelete(perform: deleteItem)
            }
        }
    }
    
    init(filterTypes: [String], sortOrder: [SortDescriptor<ExpenseItem>]) {
        _items = Query(filter: #Predicate<ExpenseItem> { item in
            filterTypes.contains(item.type)
        }, sort: sortOrder)
    }
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ListView(filterTypes: types, sortOrder: [SortDescriptor(\ExpenseItem.name)])
}

//
//  ContentView.swift
//  iExpense
//
//  Created by Débora Lage on 22/01/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var filterTypes = types
    
    var body: some View {
        NavigationStack {
            ListView(filterTypes: filterTypes, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                }
                
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $filterTypes) {
                        Text("All")
                            .tag(types)
                        
                        Text("Personal only")
                            .tag(["Personal"])

                        Text("Business only")
                            .tag(["Business"])
                    }
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                        
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

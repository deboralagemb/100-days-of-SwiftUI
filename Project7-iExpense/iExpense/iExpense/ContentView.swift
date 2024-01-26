//
//  ContentView.swift
//  iExpense
//
//  Created by Débora Lage on 22/01/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(types, id: \.self) { type in
                    Section(type) {
                        ForEach(expenses.items.filter { $0.type == type }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(
                                        item.amount < 10 ? .green : (item.amount < 100 ? .yellow : .red)
                                    )
                                    .fontWeight(.semibold)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddView(expenses: expenses)) {
                        Button("Add Expense", systemImage: "plus") {
                            //                        showingAddExpense = true
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
//            .sheet(isPresented: $showingAddExpense) {
//                AddView(expenses: expenses)
//            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

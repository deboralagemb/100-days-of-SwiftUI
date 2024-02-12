//
//  AddView.swift
//  iExpense
//
//  Created by Débora Lage on 22/01/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @State private var name = "Insert Item Name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle($name)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if name == "Insert Item Name" {
                            showingAlert = true
                            return
                        }
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert("Something went wrong!", isPresented: $showingAlert) {
                Button("Ok") { }
            } message: {
                Text("The name has not been defined!")
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
        .modelContainer(for: ExpenseItem.self)
}

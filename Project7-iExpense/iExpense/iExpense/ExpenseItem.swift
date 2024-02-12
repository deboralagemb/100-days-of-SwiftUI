//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Débora Lage on 12/02/24.
//

import Foundation
import SwiftData

let localCurrency = Locale.current.currency?.identifier ?? "USD"
let types = ["Business", "Personal"]

@Model
class ExpenseItem {
    let name: String = "Unknown"
    let type: String = "Personal"
    let amount: Double = 0.0
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}

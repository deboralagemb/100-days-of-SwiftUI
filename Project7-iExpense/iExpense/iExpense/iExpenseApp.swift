//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Débora Lage on 22/01/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}

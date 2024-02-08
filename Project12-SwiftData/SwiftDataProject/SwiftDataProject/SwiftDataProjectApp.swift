//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Débora Lage on 07/02/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

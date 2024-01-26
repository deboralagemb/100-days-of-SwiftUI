//
//  CustomToolbar.swift
//  Navigation
//
//  Created by Débora Lage on 25/01/24.
//

import SwiftUI

struct CustomToolbar: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
        }
    }
}

#Preview {
    CustomToolbar()
}

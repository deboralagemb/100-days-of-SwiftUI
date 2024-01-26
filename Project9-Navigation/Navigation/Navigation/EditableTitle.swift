//
//  EditableTitle.swift
//  Navigation
//
//  Created by Débora Lage on 25/01/24.
//

import SwiftUI

struct EditableTitle: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    EditableTitle()
}

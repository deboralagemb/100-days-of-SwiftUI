//
//  ToolbarButton.swift
//  Navigation
//
//  Created by Débora Lage on 25/01/24.
//

import SwiftUI

struct ToolbarButton: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            
                        }
                        
                        Button("Or Tap Me") {
                            
                        }
                    }
                }
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ToolbarButton()
}

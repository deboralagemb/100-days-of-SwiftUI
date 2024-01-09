//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Débora Lage on 08/01/24.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.tint)
            .font(.largeTitle)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Views and Modifiers")
            .titleStyle()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  GuessTheFlag-project2
//
//  Created by Débora Lage on 07/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("button tapped")
        }) {
            HStack(spacing: 20) {
                Image(systemName: "pencil")
                Text("edit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

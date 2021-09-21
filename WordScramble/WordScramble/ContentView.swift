//
//  ContentView.swift
//  WordScramble
//
//  Created by Débora Lage on 21/09/21.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List(people, id:\.self) {
            Text($0)
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

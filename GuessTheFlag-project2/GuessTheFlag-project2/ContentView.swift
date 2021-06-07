//
//  ContentView.swift
//  GuessTheFlag-project2
//
//  Created by Débora Lage on 07/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUi"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

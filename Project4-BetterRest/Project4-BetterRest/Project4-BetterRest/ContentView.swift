//
//  ContentView.swift
//  Project4-BetterRest
//
//  Created by Débora Lage on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var sleepAmount = 8.0
    
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    ContentView()
}

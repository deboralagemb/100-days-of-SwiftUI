//
//  ContentView.swift
//  BetterRest-project4
//
//  Created by Débora Lage on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        let now = Date()
        let tomorrow = Date().addingTimeInterval(86400)
        let range = now ... tomorrow
        DatePicker("", selection: $wakeUp, in: Date()...)
            .labelsHidden()
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(sleepAmount, specifier: "%.2f") hours")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

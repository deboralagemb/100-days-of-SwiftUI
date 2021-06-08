//
//  ContentView.swift
//  GuessTheFlag-project2
//
//  Created by Débora Lage on 07/06/21.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag ")
                Text(countries[correctAnswer])
            }
            
            ForEach( 0 ..< 3) { number in
                Button(action: {
                    // flag was tapped
                }) {
                    Image(self.countries[number]).renderingMode(.original)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

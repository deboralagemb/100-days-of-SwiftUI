//
//  ContentView.swift
//  GuessTheFlag-project2
//
//  Created by Débora Lage on 07/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
//        RadialGradient(gradient: Gradient(colors: [Color.blue, Color.black]), center: .center, startRadius: 20, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
        AngularGradient(gradient: Gradient(colors: [Color.red, Color.yellow, Color.green, Color.blue, Color.purple, Color.red]), center: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

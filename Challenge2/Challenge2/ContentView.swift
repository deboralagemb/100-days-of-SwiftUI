//
//  ContentView.swift
//  Challenge2
//
//  Created by Débora Lage on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    private var moves: [String] = ["Rock", "Paper", "Scissors"]
    @State private var shouldBeatMove: Bool = Bool.random()
    
    var body: some View {
        NavigationView {
            
            HStack {
                ForEach(0 ..< moves.count) { index in
                    Button(moves[index]) {
                        print("button \(moves[index]) tapped")
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
            .navigationBarTitle(Text("Challenge RPC"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Challenge2
//
//  Created by Débora Lage on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    private var moves: [String] = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin: Bool = Bool.random()
    @State private var moveIndex: Int = Int.random(in: 0 ..< 3)
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text(shouldWin ? "Choose an option to beat:" : "Choose an option to be defeated by:")
                        .frame(alignment: .center)
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                    
                    Text(moves[moveIndex])
                        .frame(alignment: .center)
                        .font(.system(size: 22))

                    HStack {
                        ForEach(0 ..< moves.count) { index in
                            Button(moves[index]) {
                                print("button \(moves[index]) tapped")
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
                .navigationBarTitle(Text("Challenge: RPC"))
            }
        }
        .preferredColorScheme(.dark) 
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

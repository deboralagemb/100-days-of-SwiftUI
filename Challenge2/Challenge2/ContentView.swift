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
    @State private var score: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Score: \(score)")
                        .frame(alignment: .leading)
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(shouldWin ? "Choose an option to beat:" : "Choose an option to be defeated by:")
                        .frame(alignment: .center)
                        .font(.system(size: 22))
                        .foregroundColor(.white)

                    Text(moves[moveIndex])
                        .foregroundColor(shouldWin ? .green : .red)
                        .frame(alignment: .center)
                        .font(.system(size: 22, weight: .bold))
                
                    Spacer()
                    
                    HStack {
                        ForEach(0 ..< moves.count) { index in
                            Button(moves[index]) {
                                let won = didWon(indexTapped: index, indexPC: moveIndex)
                                
                                if won == shouldWin {
                                    score += 1
                                }
                                
                                shouldWin = Bool.random()
                                moveIndex = Int.random(in: 0 ..< 3)
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(Color.gray)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    
                    Spacer()
                }
                .navigationBarTitle(Text("Challenge: RPC"))
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func didWon(indexTapped: Int, indexPC: Int) -> Bool {
        if indexTapped == indexPC {
            print("empate")
            return false
        } else if moves[(indexTapped + 1) % 3] == moves[indexPC] {
            print("perder")
            return false
        }
        
        print("ganhar")
        return true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Challenge2
//
//  Created by Débora Lage on 16/06/21.
//

import SwiftUI

enum Result {
    case win, tie, lose
}

struct ContentView: View {
    private var moves: [String] = ["Rock", "Paper", "Scissors"]
    private var emojiHand: [String] = ["👊", "✋", "✌️"]
    @State private var shouldWin: Result = Bool.random() ? .win : .lose
    @State private var moveIndex: Int = Int.random(in: 0 ..< 3)
    @State private var score: Int = 0
    @State private var showingAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Score: \(score)")
                    .frame(alignment: .leading)
                    .font(.system(size: 30))
                    .foregroundColor(.orange)
                
                VStack(alignment: .center, spacing: 60) {
                    Spacer()
                    
                    Text(shouldWin == .win ? "Choose an option to beat:" : "Choose an option to be defeated by:")
                        .frame(alignment: .center)
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                    
                    VStack {
                        Text(emojiHand[moveIndex])
                            .font(.system(size: 50, weight: .bold))
                        
                        Text(moves[moveIndex])
                            .foregroundColor(.white)
                            .frame(alignment: .center)
                            .font(.system(size: 22, weight: .bold))
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    .background(shouldWin == .win ? Color.green : Color.red)
                    .cornerRadius(10)
                    
                    HStack {
                        ForEach(0 ..< moves.count) { index in
                            Button(action: {
                                didTapButtonAt(index)
                            }) {
                                VStack(spacing: 10) {
                                    Text(emojiHand[index])
                                        .font(.system(size: 40))
                                    Text(moves[index])
                                        .foregroundColor(Color.white)
                                }
                            }
                            .frame(width: 100, height: 100, alignment: .center)
                            .background(Color.gray)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .border(shouldWin == .win ? Color.red : Color.green, width: 4)
                            .cornerRadius(10)
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Nice game!"), message: Text("Final score: \(score)"), dismissButton: .default(Text("Okidoki")) {
                                    self.finishTheGame()
                                    self.showingAlert = false
                                })
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle(Text("Challenge: RPC"))
            
        }
        .preferredColorScheme(.dark)
    }
    
    func didTapButtonAt(_ index: Int) {
        let won = didWon(indexTapped: index, indexPC: moveIndex)
        
        if won == shouldWin {
            score += 1
            if score == 10 {
                showingAlert = true
            }
        }
        
        shouldWin = Bool.random() ? .win : .lose
        moveIndex = Int.random(in: 0 ..< 3)
    }
    
    func finishTheGame() {
        shouldWin = Bool.random() ? .win : .lose
        moveIndex = Int.random(in: 0 ..< 3)
        score = 0
    }
    
    func didWon(indexTapped: Int, indexPC: Int) -> Result {
        if indexTapped == indexPC {
            return .tie
        } else if moves[(indexTapped + 1) % 3] == moves[indexPC] {
            return .lose
        }
        
        return .win
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

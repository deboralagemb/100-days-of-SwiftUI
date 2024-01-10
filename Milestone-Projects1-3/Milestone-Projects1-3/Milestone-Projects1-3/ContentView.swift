//
//  ContentView.swift
//  Milestone-Projects1-3
//
//  Created by Débora Lage on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    
    var moves = ["rock", "paper", "scissors"]
    var emojiMoves = ["👊", "🖐️", "✌️"]
    
    @State var computerChoice = Int.random(in: 0...2)
    @State var userChoice: Int = 0
    @State var userScore: Int = 0
    @State var numberOfQuestions: Int = 0
    @State var shouldWin = Bool.random()
    
    @State var showingEndOfGame = false
    @State var scoreTitle = "End of game"

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.clear, .indigo],
                               startPoint: .top,
                               endPoint: .bottom)
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    Text("Score: \(userScore)")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("App's move")
                        .fontWeight(.thin)
                    Text("\(emojiMoves[computerChoice])")
                        .font(.system(size: 80))
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(shouldWin ? .red : .green, lineWidth: 2)
                        )
                        .shadow(radius: 5)

                    Spacer()
                    
                    HStack(spacing: 5) {
                        Text("You should")
                            .foregroundStyle(.white)
                        Text("\(shouldWin ? "win" : "lose")")
                            .fontWeight(.bold)
                            .foregroundStyle(shouldWin ? .green : .red)
                    }
                    .padding()
                    .background(.secondary)
                    .clipShape(.capsule)
                    .shadow(radius: 5)
                    
                    Spacer()

                    HStack(spacing: 20) {
                        ForEach(emojiMoves.indices, id: \.self) { index in
                            Button(emojiMoves[index]) {
                                userChoice = index
                                calculateRound()
                            }
                            .padding()
                            .background(.secondary)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(shouldWin ? .green : .red, lineWidth: 2)
                            )
                            .shadow(radius: 5)
                        }
                    }
                    .font(.system(size: 80))
                    
                    Spacer()
                    Spacer()
                }
                .padding()
            }
            .ignoresSafeArea()
            .navigationTitle("Rock, Paper, Scissors")
            .alert(scoreTitle, isPresented: $showingEndOfGame) {
                Button("Play again", action: resetGame)
            } message: {
                Text("Your score is \(userScore)")
            }
        }
    }
    
    func calculateRound() {
        let userWins = (userChoice == (computerChoice + 1) % 3) && shouldWin
        let computerWins = (computerChoice == (userChoice + 1) % 3) && !shouldWin
        let userShouldScore = userWins || computerWins
        
        if userShouldScore {
            userScore += 1
        }
        
        numberOfQuestions += 1

        if numberOfQuestions == 10 {
            showingEndOfGame = true
        } else {
            resetRound()
        }
    }
    
    func resetRound() {
        computerChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func resetGame() {
        resetRound()
        userScore = 0
        numberOfQuestions = 0
    }
}

#Preview {
    ContentView()
}

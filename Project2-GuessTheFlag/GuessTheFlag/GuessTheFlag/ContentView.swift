//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Débora Lage on 03/01/24.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var score: Int = 0
    @State var numberSelected: Int = 0
    @State var numberOfRounds: Int = 0
    
    // Alert variables
    @State var showingScore = false
    @State var showingEndOfGame = false
    @State var scoreTitle = ""
    
    // Animation
    @State private var animationAmount = [0.0, 0.0, 0.0]
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline).fontWeight(.bold)
                        Text(countries[correctAnswer])
                            .font(.largeTitle).fontWeight(.semibold)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                                animationAmount[number] += 360
                                flagTapped(number)
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(
                            .degrees(animationAmount[number]),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if numberSelected == correctAnswer {
                Text("Your score is \(score)")
            } else {
                Text("That's the flag of \(countries[numberSelected])")
            }
        }
        .alert("End of game", isPresented: $showingEndOfGame) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Your game total score was: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        numberSelected = number

        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        if numberOfRounds < 8 {
            showingScore = true
        } else {
            showingEndOfGame = true
        }
    }
    
    func askQuestion() {
        numberOfRounds += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        numberOfRounds = 0
        score = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

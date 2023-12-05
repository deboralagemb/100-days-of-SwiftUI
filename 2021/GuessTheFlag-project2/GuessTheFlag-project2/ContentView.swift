//
//  ContentView.swift
//  GuessTheFlag-project2
//
//  Created by Débora Lage on 07/06/21.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

extension View {
    func imageModifier() -> some View {
        self.modifier(FlagImage())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var totalScore = 0
    @State private var flagTappedName = ""
    @State private var showingWrongFlagAlert = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag ")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach( 0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.flagTappedName = countries[number]
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .imageModifier()
                    }
                }
                
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .alert(isPresented: $showingWrongFlagAlert) {
                Alert(title: Text("Wrong"), message: Text("That’s the flag of \(flagTappedName)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            totalScore += 1
            askQuestion()
        } else {
            totalScore -= 1
            showingWrongFlagAlert = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

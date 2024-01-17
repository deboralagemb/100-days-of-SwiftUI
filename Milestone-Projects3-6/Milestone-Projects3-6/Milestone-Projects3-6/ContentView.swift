//
//  ContentView.swift
//  Milestone-Projects3-6
//
//  Created by Débora Lage on 17/01/24.
//

import SwiftUI

struct Question {
    var text: String
    var answer: String
}

struct ContentView: View {
    @State private var gameIsActive: Bool = false
    @State private var questions = [Question]()
    @State private var currentQuestion: Int = 0
    
    @State private var numberSelected: Int = 2
    
    @State private var questionsOptions: [Int] = [5, 10, 20]
    
    @State var numberOfQuestions: Int = 5
    @State var showingEndOfGame: Bool = false

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0.3803921569, alpha: 0.8470588235)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                    .navigationTitle("Multiplication Game")
                
                if gameIsActive {
                    VStack {
                        Text(questions[currentQuestion].text)
                        Text(questions[currentQuestion].answer)
                        Button {
                            if currentQuestion == numberOfQuestions - 1 {
                                showingEndOfGame = true
                            } else {
                                currentQuestion += 1
                            }
                        } label: {
                            Text("next question")
                        }
                    }
                } else {
                    VStack {
                        VStack(spacing: 20) {
                            VStack {
                                Text("Select the multiplication table you want to practice")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    Spacer()
                                    Stepper("\(numberSelected)", value: $numberSelected, in: 2...12)
                                    Spacer()
                                }
                            }
                            .padding(20)
                            .background(.ultraThinMaterial)
                            .clipShape(.buttonBorder)
                            
                            VStack {
                                Text("How many questions do you want to be asked?")
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    Picker("Questions", selection: $numberOfQuestions) {
                                        ForEach(questionsOptions, id: \.self) {
                                            Text("\($0)")
                                        }
                                    }
                                    .pickerStyle(.segmented)
                                }
                            }
                            .padding(20)
                            .background(.ultraThinMaterial)
                            .clipShape(.buttonBorder)
                            
                            Button {
                                startGame()
                            } label: {
                                Text("Start game!")
                                    .font(.headline)
                            }
                            .padding(20)
                            .background(.yellow)
                            .clipShape(.capsule)
                        }
                        .padding()
                        Spacer()
                    }
                }
            }
            .alert("End of game", isPresented: $showingEndOfGame) {
                Button("Play again", action: resetGame)
            } message: {
                Text("Your game total score was: score")
            }
        }
    }
    
    func startGame() {
        let range = 0..<numberOfQuestions
        range.forEach { index in
            let randomNumber = Int.random(in: 0..<12)
            let question = Question(text: "What is \(randomNumber) x \(numberSelected)", answer: "\(numberSelected*randomNumber)")
            
            questions.append(question)
        }
        gameIsActive = true
    }
    
    func resetGame() {
        gameIsActive = false
        currentQuestion = 0
        numberSelected = 2
        numberOfQuestions = 5
        questions.removeAll()
    }
}

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(colors: [.yellow, .blue],
                       startPoint: .top,
                       endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

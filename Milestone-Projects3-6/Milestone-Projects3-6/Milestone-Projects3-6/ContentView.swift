//
//  ContentView.swift
//  Milestone-Projects3-6
//
//  Created by Débora Lage on 17/01/24.
//

import SwiftUI

struct Question {
    var text: String
    var answer: Int
}

struct ContentView: View {
    @State private var gameIsActive: Bool = false
    @State private var questions = [Question]()
    @State private var currentQuestion: Int = 0
    
    @State private var numberSelected: Int = 2
    
    @State private var questionsOptions: [Int] = [5, 10, 20]
    
    @State var numberOfQuestions: Int = 5
    @State var showingEndOfGame: Bool = false
    @State var userGuess: Int = 0
    @State var score: Int = 0

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                    .navigationTitle("Multiplication Game")
                
                if gameIsActive {
                    VStack {
                        ZStack {
                            HStack {
                                Spacer(minLength: 30)
                                Color.blue
                                    .frame(height: 150)
                                    .clipShape(.buttonBorder)
                                    .shadow(radius: 5)
                                Spacer(minLength: 30)
                            }
                            
                            Text(questions[currentQuestion].text)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }

                        HStack {
                            Spacer()
                            TextField("Value",
                                      value: $userGuess,
                                      format: .number)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.decimalPad)
                            .toolbar {
                                ToolbarItem(placement: .keyboard) {
                                    Button("Done") {
                                        if userGuess == questions[currentQuestion].answer {
                                            score += 1
                                        }
                                        
                                        if currentQuestion == numberOfQuestions - 1 {
                                            showingEndOfGame = true
                                        } else {
                                            currentQuestion += 1
                                        }
                                    }
                                }
                            }
                            Spacer()
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
                                    .foregroundStyle(.black)
                            }
                            .padding(20)
                            .background(Color("secondary_pink"))
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
                Text("Your game total score was: \(score)")
            }
        }
    }
    
    func startGame() {
        let range = 0..<numberOfQuestions
        range.forEach { index in
            let randomNumber = Int.random(in: 0..<12)
            let question = Question(text: "\(randomNumber) x \(numberSelected)", answer: numberSelected*randomNumber)
            
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
        Color("primary_yellow")
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

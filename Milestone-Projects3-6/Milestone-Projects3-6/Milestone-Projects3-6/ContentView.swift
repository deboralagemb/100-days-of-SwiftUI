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
    @State private var gameIsActive = false
    @State private var questions = [Question]()

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0.3803921569, alpha: 0.8470588235)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                    .navigationTitle("Multiplication Game")

                VStack {
                    InputGameView()
                    Spacer()
                }
            }
        }
    }
}

struct GameView: View {
    
    var completion: () -> Void
    
    var body: some View {
        Button {
            completion()
        } label: {
            Text("Start game!")
                .font(.headline)
        }
        .padding(20)
        .background(.yellow)
        .clipShape(.capsule)
    }
}

struct InputGameView: View {
    
    @State private var tableNumber: Int = 2
    @State private var numberOfQuestions: Int = 5

    var body: some View {
        VStack(spacing: 20) {
            MultiplicationTableInput { number in
                tableNumber = number
            }
            QuestionsInput(questionSelected: numberOfQuestions)
            GameView {
                print(numberOfQuestions)
                print("starts game")
            }
        }
        .padding()
    }
}

struct MultiplicationTableInput: View {
    
    @State private var numberSelected = 2
    var completion: (Int) -> Void
    
    var body: some View {
        VStack {
            Text("Select the multiplication table you want to practice")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                Stepper("\(numberSelected)", value: $numberSelected, in: 2...12) { _ in
                    completion(numberSelected)
                }
                Spacer()
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .clipShape(.buttonBorder)
    }
}

struct QuestionsInput: View {

    @State private var questionsOptions = [5, 10, 20]
    @State var questionSelected: Int
     
    var body: some View {
        VStack {
            Text("How many questions do you want to be asked?")
                .font(.headline)
                .multilineTextAlignment(.center)

            HStack {
                Picker("Questions", selection: $questionSelected) {
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

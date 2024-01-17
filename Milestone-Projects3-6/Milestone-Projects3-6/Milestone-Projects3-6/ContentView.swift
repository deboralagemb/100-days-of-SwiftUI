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
                    .navigationTitle("Multiplication")

                VStack {
                    InputGameView()
                    GameView()
                }
                
            }
        }
    }
}

struct GameView: View {
    
    var body: some View {
        Button {
            print("Starts game")
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
    
    @State private var numberSelected = 2
    @State private var questionsOptions = [5, 10, 20]
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Select the multiplication table you want to practice")
                Stepper("\(numberSelected)", value: $numberSelected, in: 2...12)
            }
            
            HStack {
                Text("How many questions do you want to be asked?")
                HStack {
                    ForEach(questionsOptions, id: \.self) { number in
                        Button {
                            print("teste")
                        } label: {
                            Text("\(number)")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.purple)
                        }
                    }
                }
            }
        }
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

//
//  ContentView.swift
//  Animations
//
//  Created by Débora Lage on 12/01/24.
//

import SwiftUI

enum Animations: String, CaseIterable {
    case implicitAnimation1
    case implicitAnimation2
    case implicitAnimation3
    case implicitAnimation4
    case implicitAnimation5
    case animatingBindings
    case explicitAnimation1
}

struct ContentView: View {
    @State private var animations = [
        "Implicit Animation 1",
        "Implicit Animation 2",
        "Implicit Animation 3",
        "Implicit Animation 4",
        "Implicit Animation 5",
        "Animating Bindings",
        "Explicit Animation 1"
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(animations.enumerated()), id: \.offset) { index, animation in
                    NavigationLink(destination: DetailView(animationTitle: animation, animationType: Animations.allCases[index])) {
                        Line(text: animation)
                    }
                }
            }
            .navigationTitle("Animations")
        }
    }
}

struct DetailView: View {
    var animationTitle: String
    var animationType: Animations

    var body: some View {
        VStack {
            switch animationType {
            case .implicitAnimation1:
                ImplicitAnimation1()
            case .implicitAnimation2:
                ImplicitAnimation2()
            case .implicitAnimation3:
                ImplicitAnimation3()
            case .implicitAnimation4:
                ImplicitAnimation4()
            case .implicitAnimation5:
                ImplicitAnimation5()
            case .animatingBindings:
                AnimatingBindings()
            case .explicitAnimation1:
                ExplicitAnimations()
            }
        }
        .navigationTitle(animationTitle)
    }
}

struct Line: View {
    var text: String

    var body: some View {
        Text(text)
    }
}

struct ImplicitAnimation1: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct ImplicitAnimation2: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.linear, value: animationAmount)
    }
}

struct ImplicitAnimation3: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
    }
}

struct ImplicitAnimation4: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(
            .easeInOut(duration: 2)
            .delay(1)
            .repeatCount(3, autoreverses: true),
            value: animationAmount
        )
    }
}

struct ImplicitAnimation5: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Color.red
            .clipShape(.circle)
            .padding(50)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
    }
}

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
        Spacer()
        Button("Tap me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
    }
}

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ContentView()
}


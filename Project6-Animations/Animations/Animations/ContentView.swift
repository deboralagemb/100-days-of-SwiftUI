//
//  ContentView.swift
//  Animations
//
//  Created by Débora Lage on 12/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmountDefault = 1.0
    @State private var animationAmountCustom1 = 1.0
    @State private var animationAmountCustom2 = 1.0
    @State private var animationAmountCustom3 = 1.0
    @State private var animationAmountCustom4 = 1.0
    @State private var animationBindings = 1.0
    @State private var animationAmountExplicit = 0.0
    
    var body: some View {
        VStack {
            Text("Implicit Animation")
                .font(.title)
            
            HStack {
                Button("1") {
                    animationAmountDefault += 1
                }
                .padding(30)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmountDefault)
                .blur(radius: (animationAmountDefault - 1) * 3)
                .animation(.default, value: animationAmountDefault)
                
                Button("2") {
                    animationAmountCustom1 += 1
                }
                .padding(30)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmountCustom1)
                .blur(radius: (animationAmountCustom1 - 1) * 3)
                .animation(.linear, value: animationAmountCustom1)
                
                Button("3") {
                    animationAmountCustom2 += 1
                }
                .padding(30)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmountCustom2)
                .blur(radius: (animationAmountCustom2 - 1) * 3)
                .animation(.spring(duration: 1, bounce: 0.9), value: animationAmountCustom2)
                
                Button("4") {
                    animationAmountCustom3 += 1
                }
                .padding(30)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmountCustom3)
                .blur(radius: (animationAmountCustom3 - 1) * 3)
                .animation(
                    .easeInOut(duration: 2)
                        .delay(1)
                        .repeatCount(3, autoreverses: true),
                    value: animationAmountCustom3
                )
            }
            
            HStack {
                Color.red
                    .clipShape(.circle)
                    .frame(width: 70, height: 70)
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmountCustom4)
                            .opacity(2 - animationAmountCustom4)
                            .animation(
                                .easeOut(duration: 1)
                                    .repeatForever(autoreverses: false),
                                value: animationAmountCustom4
                            )
                    )
                    .onAppear {
                        animationAmountCustom4 = 2
                    }
            }
            
            Text("Animating Bindings")
                .font(.title)
            
            HStack {
                Stepper("Scale amount", value: $animationBindings.animation(), in: 1...10)
                Button("6") {
                    animationBindings += 1
                }
                .padding(40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationBindings)
            }
            
            Text("Explicit Animations")
                .font(.title)

            Button("7") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmountExplicit += 360
                }
            }
            .padding(30)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmountExplicit), axis: (x: 0, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}


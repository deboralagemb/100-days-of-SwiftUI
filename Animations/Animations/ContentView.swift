//
//  ContentView.swift
//  Animations
//
//  Created by Débora Lage on 22/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        Button("tap me") {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        if isShowingRed {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .opacity))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

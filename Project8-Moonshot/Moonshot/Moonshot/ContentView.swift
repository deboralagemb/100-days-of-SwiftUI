//
//  ContentView.swift
//  Moonshot
//
//  Created by Débora Lage on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if showingGrid {
                        GridLayout(missions: missions, astronauts: astronauts)
                    } else {
                        ListLayout(missions: missions, astronauts: astronauts)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Toggle display") {
                        showingGrid.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

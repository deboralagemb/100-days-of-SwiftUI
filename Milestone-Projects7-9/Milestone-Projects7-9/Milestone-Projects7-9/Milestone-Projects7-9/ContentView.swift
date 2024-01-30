//
//  ContentView.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 29/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var habits = Habits()
    @State var showingAddHabit = false
    
    init(habits: Habits = Habits()) {
        self.habits = habits
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.activities) { habit in
                    HStack {
                        NavigationLink(destination: ActivityDetailView(activity: habit)) {
                            VStack(alignment: .leading) {
                                Text(habit.title)
                                    .foregroundStyle(.primary)
                                Text(habit.description)
                                    .foregroundStyle(.secondary)
                                Text(habit.timesCompleted.formatted())
                                    .foregroundStyle(habit.timesCompleted > 0 ? .green : .red)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Habit", systemImage: "plus") {
                        showingAddHabit = true
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

//
//  ActivityDetailView.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 30/01/24.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var activity: Activity
    var habits: Habits
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    Text("\(activity.description)")
                    
                    Stepper("Achieved \(activity.timesCompleted) times", value: $activity.timesCompleted, in:  0...100, step: 1)
                }
            }
            .navigationTitle(activity.title)
            .onDisappear {
                guard let index = habits.activities.firstIndex(where: { $0.id == activity.id }) else { return }
                habits.activities[index] = activity
            }
        }
    }
}

#Preview {
    let activity = Activity(title: "Title", description: "Description", timesCompleted: 0)
    let habits = Habits()
    habits.activities.append(activity)
    
    return ActivityDetailView(activity: activity, habits: habits)
}

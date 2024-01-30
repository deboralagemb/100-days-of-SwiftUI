//
//  ActivityDetailView.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 30/01/24.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    Text("\(activity.description)")
                    Text("Achieved \(activity.timesCompleted) times")
                }
            }
            .navigationTitle(activity.title)
        }
    }
}

#Preview {
    let activity = Activity(title: "Title", description: "Description", timesCompleted: 0)
    return ActivityDetailView(activity: activity)
}

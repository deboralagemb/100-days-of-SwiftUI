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
                Section("Title") {
                    Text(activity.title)
                }
                
                Section("Description") {
                    Text(activity.description)
                }
                
                Section("Times completed") {
                    Text("\(activity.timesCompleted) times")
                }
            }
        }
    }
}

#Preview {
    let activity = Activity(title: "Title", description: "Description", timesCompleted: 0)
    return ActivityDetailView(activity: activity)
}

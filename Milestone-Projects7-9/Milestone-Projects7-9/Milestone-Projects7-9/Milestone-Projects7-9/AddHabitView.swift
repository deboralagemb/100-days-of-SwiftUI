//
//  AddHabitView.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 30/01/24.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var timesCompleted: Int = 0
    @State private var alertIsPresenting: Bool = false
    @State private var alertMessage: String = ""
   
    var habits: Habits
    var alertTitle: String = "Something went wrong"

    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
                
                Stepper("\(timesCompleted) times completed", value: $timesCompleted, in: 0...100, step: 1)
            }
            .navigationTitle("Add Activity")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        configureAlert()
                        if !title.isEmpty, !description.isEmpty {
                            let activity = Activity(title: title, description: description, timesCompleted: timesCompleted)
                            habits.activities.append(activity)
                            dismiss()
                        }
                    } label: {
                        Text("Save")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button  {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .alert(alertTitle, isPresented: $alertIsPresenting) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func configureAlert() {
        if title.isEmpty {
            alertMessage = "Please add a title"
            alertIsPresenting = true
            return
        }
        
        if description.isEmpty {
            alertMessage = "Please add a description"
            alertIsPresenting = true
            return
        }
    }
}

#Preview {
    let activity = Activity(title: "Title", description: "Description", timesCompleted: 3)
    let habits = Habits()
    habits.activities.append(activity)
    return AddHabitView(habits: habits)
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by Débora Lage on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    let students = ["harry", "hermione", "ron"]
    @State private var selectedStudent = "harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your students", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

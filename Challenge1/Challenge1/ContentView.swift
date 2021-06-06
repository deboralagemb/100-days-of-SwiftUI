//
//  ContentView.swift
//  Challenge1
//
//  Created by Débora Lage on 06/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue = ""
    @State private var initialUnit = "Celsius"
    @State private var convertedValue = ""
    @State private var convertedUnit = "Celsius"
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Initial value", text: $initialValue)
                    Picker("Initial unit", selection: $initialUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    TextField("Converted value", text: $convertedValue).disabled(true)
                    
                    Picker("Unit to convert", selection: $convertedUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("TemperatureConverter", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Challenge1
//
//  Created by Débora Lage on 06/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue = ""
    @State private var initialUnit = 1
    @State private var convertedUnit = 1
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var finalValue: Double {
        switch initialUnit {
        case 0:
            return celsiusTo()
        case 1:
            return fahrenheitTo()
        case 2:
            return kelvinTo()
        default:
            return 0
        }
    }
    
    func celsiusTo() -> Double {
        let initialValue = Double(initialValue) ?? 0
        switch convertedUnit {
        case 0:
            return initialValue
        case 1:
            return initialValue * (9.0/5) + 32
        case 2:
            return initialValue + 273.15
        default:
            return 0
        }
    }
    
    func fahrenheitTo() -> Double {
        let initialValue = Double(initialValue) ?? 0
        switch convertedUnit {
        case 0:
            return (initialValue - 32) * (5.0/9)
        case 1:
            return initialValue
        case 2:
            return (initialValue - 32) * (5.0/9) + 273.15
        default:
            return 0
        }
    }
    
    func kelvinTo() -> Double {
        let initialValue = Double(initialValue) ?? 0
        switch convertedUnit {
        case 0:
            return initialValue - 273.15
        case 1:
            return (initialValue - 273.15) * (9.0/5) + 32
        case 2:
            return initialValue
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Initial value", text: $initialValue)
                        .keyboardType(.decimalPad)
                    
                    Picker("Initial unit", selection: $initialUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted value")) {
                    Text("\(finalValue, specifier: "%.2f")")
                    
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

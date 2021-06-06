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
        let initialValueInCelsius = initialValueInCelsius()
        let result: Double
        
        switch convertedUnit {
        case 0:
            result = initialValueInCelsius
        case 1:
            result = Measurement(value: initialValueInCelsius, unit: UnitTemperature.celsius).converted(to: .fahrenheit).value
        case 2:
            result = Measurement(value: initialValueInCelsius, unit: UnitTemperature.celsius).converted(to: .kelvin).value
        default:
            result = initialValueInCelsius
        }
        
        return result
    }
    
    func initialValueInCelsius() -> Double {
        let initialValue = Double(initialValue) ?? 0
        var result: Double
        
        switch initialUnit {
        case 0:
            result = initialValue
        case 1:
            let fahrenheit = Measurement(value: initialValue,
                                         unit: UnitTemperature.fahrenheit)
            result = fahrenheit.converted(to: .celsius).value
        case 2:
            let kelvin = Measurement(value: initialValue,
                                     unit: UnitTemperature.kelvin)
            result = kelvin.converted(to: .celsius).value
        default:
            result = initialValue
        }
        
        return result
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

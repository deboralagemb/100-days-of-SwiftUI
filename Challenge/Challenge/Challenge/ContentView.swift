//
//  ContentView.swift
//  Challenge
//
//  Created by Débora Lage on 13/12/23.
//

import SwiftUI

enum Metric: String {
    case celsius
    case fahrenheit
    case kelvin
}

struct ContentView: View {
    @State var inputSelection: Metric = .celsius
    @State var outputSelection: Metric = .fahrenheit
    var metrics: [Metric] = [.celsius, .fahrenheit, .kelvin]
    
    @State var inputValue: Double = 0
    var outputValue: Double {
        return convertTemperature(inputSelection: inputSelection,
                                  outputSelection: outputSelection,
                                  inputValue: inputValue)
    }
    
    func convertTemperature(inputSelection: Metric, outputSelection: Metric, inputValue: Double) -> Double {
        switch (inputSelection, outputSelection) {
        case (.celsius, .fahrenheit):
            return (inputValue * 9.0/5) + 32
        case (.celsius, .kelvin):
            return inputValue + 273.15
        case (.fahrenheit, .celsius):
            return (inputValue - 32) * 5.0/9
        case (.fahrenheit, .kelvin):
            return (inputValue - 32) * 5.0/9 + 273.15
        case (.kelvin, .celsius):
            return inputValue - 273.15
        case (.kelvin, .fahrenheit):
            return (inputValue - 273.15) * 9.0/5 + 32
        default:
            return inputValue
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("INPUT") {
                    TextField("Input",
                              value: $inputValue,
                              format: .number)
                    .keyboardType(.decimalPad)
                    
                    Picker("Metric", selection: $inputSelection) {
                        ForEach(metrics, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("OUTPUT") {
                    Text(String(format: "%.2f", outputValue))
                    
                    Picker("Metric", selection: $outputSelection) {
                        ForEach(metrics, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

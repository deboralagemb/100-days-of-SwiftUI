//
//  ContentView.swift
//  Project4-BetterRest
//
//  Created by Débora Lage on 09/01/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    HStack {
                        Spacer()
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                        Spacer()
                    }
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Picker("^[\(coffeeAmount) cup](inflect: true)",
                           selection: $coffeeAmount) {
                        ForEach(0...20, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                .listRowSeparator(.hidden)
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Text("Your ideal bedtime is:")
                        .font(.title2)
                    
                    Text("\(calculateBedtime)")
                        .font(.largeTitle)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("BetterRest")
        }
    }
    
    var calculateBedtime: String {
        var message: String
        
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            message = (wakeUp - prediction.actualSleep).formatted(date: .omitted, time: .shortened)
        } catch {
            message = "Sorry, there was a problem calculating your bedtime."
        }
        
        return message
    }
}

#Preview {
    ContentView()
}

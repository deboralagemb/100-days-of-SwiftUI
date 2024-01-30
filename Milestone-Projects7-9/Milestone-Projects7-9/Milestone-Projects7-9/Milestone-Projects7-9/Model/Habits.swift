//
//  Habits.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 29/01/24.
//

import Foundation

@Observable
class Habits {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedData) {
                activities = decodedItems
                return
            }
        }
        
        activities = []
    }
}

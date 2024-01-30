//
//  Activity.swift
//  Milestone-Projects7-9
//
//  Created by Débora Lage on 29/01/24.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var timesCompleted: Int
    
    init(title: String, description: String, timesCompleted: Int) {
        self.title = title
        self.description = description
        self.timesCompleted = timesCompleted
    }
}

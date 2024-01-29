//
//  Mission.swift
//  Moonshot
//
//  Created by Débora Lage on 23/01/24.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        lhs.id == rhs.id
    }
}

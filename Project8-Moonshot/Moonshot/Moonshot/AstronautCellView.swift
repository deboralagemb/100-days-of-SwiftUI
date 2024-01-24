//
//  AstronautCellView.swift
//  Moonshot
//
//  Created by Débora Lage on 24/01/24.
//

import SwiftUI

struct AstronautCellView: View {
    let crewMember: MissionView.CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay(
                    Capsule()
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text(crewMember.role)
                    .foregroundStyle(.white.opacity(0.5))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let crewMember = MissionView.CrewMember(role: "Lunar Module Pilot", astronaut: astronauts["aldrin"]!)
    
    return AstronautCellView(crewMember: crewMember)
        .preferredColorScheme(.dark)
}

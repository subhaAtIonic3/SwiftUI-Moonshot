//
//  AstronautView.swift
//  Moonshot_2
//
//  Created by Subhrajyoti Chakraborty on 24/06/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    let allMissions: [Mission] = Bundle.main.decode("missions.json")
    var flewMissions: [Mission] {
        var missions = [Mission]()
        missions = allMissions.filter{ mission in
            return mission.crew.contains(where: { $0.name == astronaut.id })
        }
        return missions
    }
    
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .layoutPriority(1)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Mission\(self.flewMissions.count > 1 ? "s" : "")")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(self.flewMissions) { mission in
                        HStack {
                            Image("\(mission.image)")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text("\(mission.displayName)")
                                Text("\(mission.formattedLaunchDate)")
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static let astronaut: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronaut[0])
    }
}

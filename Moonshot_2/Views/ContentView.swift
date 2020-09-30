//
//  ContentView.swift
//  Moonshot_2
//
//  Created by Subhrajyoti Chakraborty on 21/06/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showSettingsView = false
    @State private var showDetails = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, showDate: self.showDetails)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .sheet(isPresented: $showSettingsView, content: {
                SettingsView(showDetails: self.$showDetails)
            })
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button(action: {
                self.showSettingsView.toggle()
            }, label: {
                Image(systemName: "gear")
                Text("Settings")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


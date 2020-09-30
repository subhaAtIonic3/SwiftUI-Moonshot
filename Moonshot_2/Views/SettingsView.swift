//
//  SettingsView.swift
//  Moonshot_2
//
//  Created by Subhrajyoti Chakraborty on 30/09/20.
//  Copyright © 2020 Subhrajyoti Chakraborty. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment (\.presentationMode) var presentationMode
    @Binding var showDetails: Bool
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Toggle("Hide astronauts details", isOn: self.$showDetails)
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.turn.up.left")
                Text("Back")
            }))
            .navigationBarTitle(Text("Settings"), displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showDetails: .constant(false))
    }
}

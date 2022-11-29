//
//  ContentView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 21.11.22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var username = true

    var body: some View {
        NavigationView {
            if username {
                FooterView()
            } else {
                
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



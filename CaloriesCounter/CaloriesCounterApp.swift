//
//  CaloriesCounterApp.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 21.11.22.
//

import SwiftUI

@main
struct CaloriesCounterApp: App {
    
    @StateObject private var realmManager = RealmManager.shared
    
    var body: some Scene {
        WindowGroup {

            

            VStack {
                if let configuration = realmManager.configuration, let realm = realmManager.realm {
                    ContentView()
                        .environment(\.realmConfiguration, configuration)
                        .environment(\.realm, realm) // Access for the project
                    FooterView()
                }
            }.task {
                try? await realmManager.initialize() // ladet die published variablen und erst dann wir der Vstack geladen
            }

        }
    }
}


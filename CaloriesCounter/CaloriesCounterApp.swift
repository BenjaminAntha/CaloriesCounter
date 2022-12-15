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
    @State private var loading = true

    var body: some Scene {
        WindowGroup {
            VStack {
                if !loading {
                    if realmManager.user != nil{
                        if let configuration = realmManager.configuration, let realm = realmManager.realm{
                            ContentView()
                                .environment(\.realmConfiguration, configuration)
                                .environment(\.realm, realm) // Access for the project
                        }
                    } else {
                        LoginView()
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
                
            }.task {
                try? await realmManager.initializeCurrentUser() // ladet die published variablen und erst dann wir der Vstack geladen
                loading = false
            }
        }
    }
}


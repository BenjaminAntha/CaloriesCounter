//
//  Profil.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI

struct ProfilView: View {
    @State var isLoggedOut = false
    
    var Markus = Person(name: "Markus", height: 188, weight: 80, age: 45, dailyIntake: 2200)
    
    var body: some View {
        
        Form{
            Section(header: Text("Profil:")){
                Text("Name: " + Markus.name)
                Text("Alter: " + String(Markus.age))
                Text("Grösse: " + String(Int(Markus.height)) + " cm")
                Text("Gewicht: " + String(Int(Markus.weight)) + " kg")
                Text("Kalorien/Tag: " + String(Markus.dailyIntake) + " kcal")
            }
            Button("Logout", action: logOut)
        }
        .onChange(of: isLoggedOut) { isLoggedOut in
            RealmManager.shared.logout()
        }
        .padding()
    }
    
    func logOut() {
        isLoggedOut = true
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

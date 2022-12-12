//
//  Profil.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI
import RealmSwift

struct ProfilView: View {
    @ObservedRealmObject var currentUser: UserAcc

    @State var isLoggedOut: Bool = false
        
    var body: some View {
       
        Form{
            Section(header: Text("Profil:")){
                Text("Vorname: " + currentUser.firstName)
                Text("Nachname: " + currentUser.lastName)
                Text("Grösse: " + String(currentUser.bodyHeight) + " cm")
                Text("Gewicht: " + String(currentUser.weight) + " kg")
                Text("Kalorien/Tag: " + String(currentUser.caloriesGoal) + " kcal")
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
        ProfilView(currentUser: UserAcc())
    }
}

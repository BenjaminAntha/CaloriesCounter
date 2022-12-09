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
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
    
    var currentuser: UserAcc? {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    @State var isLoggedOut: Bool = false
    
    var Markus = Person(name: "Markus", height: 188, weight: 80, age: 45, dailyIntake: 2200)
    
    var body: some View {
        NavigationView{
            
            
            
            Form{
                Section(header: Text("Profil:")){
                    Text("Vorname: " + currentuser!.firstName)
                    Text("Nachname: " + currentuser!.lastName)
                    Text("Grösse: " + String(currentuser!.bodyHeight) + " cm")
                    Text("Gewicht: " + String(currentuser!.weight) + " kg")
                    Text("Kalorien/Tag: " + String(currentuser!.caloriesGoal) + " kcal")
                }
                Button("Logout", action: logOut)
            }
            .onChange(of: isLoggedOut) { isLoggedOut in
                RealmManager.shared.logout()
            }
            .padding()
            .onAppear(perform: adduser)
        }
    }
    
    func logOut() {
        isLoggedOut = true
    }
    
    func adduser() {
        if (currentuser?.weight == 0) {
            let userA = UserAcc(firstName: UserAcc.currentuser.firstName, lastName: UserAcc.currentuser.lastName, sex: "m", birthdate: Date(), bodyHeight: 22, goal: Goal.holdWeight, weight: 22, weightGoal: "22", caloriesGoal: 22, userId: RealmManager.shared.user!.id)
            
            $userAccs.append(userA)
        }
        
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

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
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
    @Environment(\.realm) var realm
    var currentuser: UserAcc? {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    @State var isLoggedOut: Bool = false
    
    var body: some View {
        NavigationView{
            Form {
                let yearNow = Calendar.current.dateComponents([.year], from: Date()).year ?? 0
                let yearBirth = Calendar.current.dateComponents([.year], from: currentUser.birthdate).year ?? 0
                let age: Double = Double(yearNow - yearBirth)
                Section(header: Text("Profil:")){
                    Text("Vorname: " + currentUser.firstName)
                    Text("Nachname: " + currentUser.lastName)
                    Text("Alter: " + String(age))
                    Text("Geschlecht: " + currentUser.sex)
                    Text("Ziel: " + currentUser.goal.rawValue)
                    Text("Grösse: " + String(currentUser.bodyHeight) + " cm")
                    Text("Gewicht: " + String(currentUser.weight) + " kg")
                    Text("Kalorien/Tag: " + String(currentUser.caloriesGoal) + " kcal")
                }
                Button("Logout", action: logOut)
                    .foregroundColor(.green)
            }
            .task {
                await refreshUser()
            }
            .onChange(of: isLoggedOut)  { isLoggedOut  in 
                
                UserAcc.currentuser.firstName = "not set"
                UserAcc.currentuser.lastName = "not set"
                UserAcc.currentuser.sex = ""
                UserAcc.currentuser.birthdate = Date()
                UserAcc.currentuser.bodyHeight = 0
                UserAcc.currentuser.goal = Goal.holdWeight
                UserAcc.currentuser.weightGoal = 0
                UserAcc.currentuser.caloriesGoal = 0
                Task{
                  RealmManager.shared.logout()
                }
            }
        }
    }
    func refreshUser() async{
        if (currentuser?.userId == "" && RealmManager.shared.user != nil) {
            try? realm.write{
                
                let user = UserAcc.currentuser
                let userA = UserAcc(firstName: user.firstName, lastName: user.lastName, sex: user.sex, birthdate: user.birthdate, bodyHeight: user.bodyHeight, goal: user.goal, weight: user.weight, weightGoal: 420, caloriesGoal: user.caloriesGoal, userId: RealmManager.shared.user!.id)
                
                $userAccs.append(userA)
                realm.refresh()
            }
        }
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

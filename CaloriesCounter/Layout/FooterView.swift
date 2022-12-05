//
//  Footer.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI
import RealmSwift

struct FooterView: View {
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
    
    var currentuser: UserAcc? {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
        var body: some View {
            TabView {
                StartMenuView()
                    .tabItem {
                        Label("Kalender", systemImage: "calendar")
                    }
                
                StatsView()
                    .tabItem {
                        Label("Statistik", systemImage: "chart.bar.xaxis")
                    }
                
                AddFoodView()
                    .tabItem {
                        Label("Add", systemImage: "plus")
                    }
                
                FoodLogView()
                    .tabItem {
                        Label("Essen", systemImage: "fork.knife")
                    }
                
                ProfilView()
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
            }.onAppear(perform: adduser)
        }
    
        func adduser() {
            if (currentuser?.weight == 0) {
                let userA = UserAcc(firstName: UserAcc.currentuser.firstName, lastName: UserAcc.currentuser.lastName, sex: "m", birthdate: Date(), bodyHeight: 22, goal: Goal.holdWeight, weight: 22, weightGoal: "22", caloriesGoal: 22, userId: RealmManager.shared.user!.id)
                
                $userAccs.append(userA)
            }
            
        }
    }

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

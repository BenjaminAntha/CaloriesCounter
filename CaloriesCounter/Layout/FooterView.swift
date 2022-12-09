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
    
    let footerColor = UIColor.white
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
                    .toolbarBackground(

                            // 1
                            Color.yellow,
                            // 2
                            for: .tabBar)
                
                StatsView()
                    .tabItem {
                        Label("Statistik", systemImage: "chart.bar.xaxis")
                    }
                    .toolbarBackground(

                            // 1
                            Color.red,
                            // 2
                            for: .tabBar)
                
                AddFoodView()
                    .tabItem {
                        Label("Add", systemImage: "plus")
                    }
                    .toolbarBackground(

                            // 1
                            Color.red,
                            // 2
                            for: .tabBar)
                    
                
                FoodLogView()
                    .tabItem {
                        Label("Essen", systemImage: "fork.knife")
                    }
                    .toolbarBackground(

                            // 1
                            Color.red,
                            // 2
                            for: .tabBar)
                
                ProfilView()
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
                    .toolbarBackground(

                            // 1
                            Color.red,
                            // 2
                            for: .tabBar)
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

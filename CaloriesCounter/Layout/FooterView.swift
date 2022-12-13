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
    @Environment(\.realm) var realm
    
    var currentuser: UserAcc? {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
        var body: some View {
            TabView {
                VStack {
                    StartMenuView(currentUser: currentuser ?? UserAcc())
                }
                .tabItem {
                    Label("Kalender", systemImage: "calendar")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    StatsView()
                }
                .tabItem {
                    Label("Statistik", systemImage: "chart.bar.xaxis")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
                VStack{
                    AddFoodView(currentUser: currentuser ?? UserAcc())
                }
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color("lightGrayRB"))
                    
                VStack{
                    FoodLogView()
                }
                    .tabItem {
                        Label("Essen", systemImage: "fork.knife")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                VStack{
                    ProfilView(currentUser: currentuser ?? UserAcc())
                }
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }.task{
                await adduser()
            }   
            .edgesIgnoringSafeArea(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        func adduser() async{
            if (currentuser?.weight == 0 && UserAcc.currentuser.firstName != "not set") {
                try? realm.write{
                    let userA = UserAcc(firstName: UserAcc.currentuser.firstName, lastName: UserAcc.currentuser.lastName, sex: "m", birthdate: Date(), bodyHeight: 7687968, goal: Goal.holdWeight, weight: 45356, weightGoal: "22", caloriesGoal: 22, userId: RealmManager.shared.user!.id)
                                    
                    $userAccs.append(userA)
                }
               
            }
            
        }
    }

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

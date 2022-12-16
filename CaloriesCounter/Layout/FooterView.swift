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
                }.task {
                    await adduser()
                }
                .tabItem {
                    Label("Kalender", systemImage: "calendar")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .toolbarBackground(Color.green.opacity(0.2), for: .tabBar)
                
                VStack {
                    StatsView()
                }
                .tabItem {
                    Label("Statistik", systemImage: "chart.bar.xaxis")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               
                VStack{
                    AddFoodView(currentUser: currentuser ?? UserAcc())
                }.task {
                    await adduser()
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
                .task {
                    await adduser()
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
            if (currentuser?.userId == "" && RealmManager.shared.user != nil) {
                try? realm.write{
                    
                    let user = UserAcc.currentuser
                    let userA = UserAcc(firstName: user.firstName, lastName: user.lastName, sex: user.sex, birthdate: user.birthdate, bodyHeight: user.bodyHeight, goal: user.goal, weight: user.weight, weightGoal: 420, caloriesGoal: user.caloriesGoal, userId: RealmManager.shared.user!.id)
                    
                    $userAccs.append(userA)
                    realm.refresh()
                    
                }
            }
            
        }
    }

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

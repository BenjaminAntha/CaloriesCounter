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
                VStack {
                    StartMenuView()
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
                    AddFoodView()
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
                    ProfilView()
                }
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }.onAppear(perform: adduser)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                
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

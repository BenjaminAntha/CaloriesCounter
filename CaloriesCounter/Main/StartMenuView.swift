//
//  StartMenu.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI
import RealmSwift

struct StartMenuView: View {
    @ObservedRealmObject var currentUser: UserAcc
    
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
        
    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }

    @State var progress: Double = 0.5
    @State var date: Date = Date()
    
    var daily: Daily {
        var k = Daily()
        for d in currentuser.daily {
            if d.date == date.formatted(.dateTime.year().month().day()) {
                k = d
            }
        }
        return k
    }                
    
    var body: some View {
        Color.green.opacity(0.2)
            .ignoresSafeArea()
            .overlay(           
                VStack {
                HeaderView(dateAngezeigt: $date)
                    .frame(maxWidth: .infinity, maxHeight: 170)
                    .offset(x: 0, y: -128)
                        ZStack {
                            // 2
                            ProgressCircleView(progress: daily.caloriesEaten / 5000)
                            // 3
                            Text("\(daily.caloriesEaten, specifier: "%.0f")")
                                .font(.largeTitle)
                                .bold()
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                HStack{
                    VStack {
                        Text("Kohlenhydrate")
                        Text(String(daily.carbohydrates))
                    }
                    .padding()
                    Spacer(minLength: 1)
                    VStack{
                        
                        Text("Protein")
                        Text(String(daily.protein))
                        
                    }
                    .padding()
                    Spacer()
                    VStack{
                        Text("Fett")
                        Text(String(daily.fat))
                        
                    }
                    .padding()
                }
                .fontWeight(.light)
                .font(.system(size: 15))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(0)
                .frame(width: 300, height: 75)
                .background(Rectangle().fill(Color.white).shadow(radius: 3))
                .offset(x:0,y: 50)
                .multilineTextAlignment(.center)
            })
        
        .frame(maxWidth: .infinity, maxHeight: 750)
    }
    
    func resetProgress() {
        progress = 0
    }
    
    func updater(){
        progress = daily.caloriesEaten / 5000
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView(currentUser: UserAcc())
    }
}

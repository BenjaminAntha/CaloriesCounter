//
//  StartMenu.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI
import RealmSwift
import WrappingHStack

struct StartMenuView: View {
    @ObservedRealmObject var currentUser: UserAcc
    
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
        
    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    
    @Environment(\.realm) var realm

    
    @State var progress: Double = 0
    @State var date: Date = Date()
    @State private var caloriesBurned: Double = 0.5

    
    var daily: Daily {
        var k = Daily()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat =  "d. MMM. y"
        let dateEdited = formatter.string(from: date)
        for d in currentuser.daily {
            if  d.userId == currentuser.userId && d.date == dateEdited{
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
                    
                    ScrollView{
                        VStack {
                            ZStack {
                                // 2
                                ProgressCircleView(progress: daily.caloriesEaten / currentuser.caloriesGoal)
                                // 3
                                VStack{
                                    Text("\(daily.caloriesEaten, specifier: "%.1f")")
                                        .font(.largeTitle)
                                        .bold()
                                    Text("Gegessen")
                                }
                                
                            }
                            .frame(width: 200, height: 200)
                            .padding(.top, 30)
                            
                            HStack{
                                VStack{
                                    Text("\(currentuser.caloriesGoal - daily.caloriesEaten + daily.caloriesBurned, specifier: "%.1f")")
                                    Text("Übrig")
                                }
                                Spacer()
                                VStack{
                                    Text("\(daily.caloriesBurned, specifier: "%.1f")")
                                    Text("Verbrannt")
                                }
                                
                            }
                            .padding(.bottom, 20)
                            .padding(25)
                                
                            
                            
                            HStack{
                                VStack {
                                    Text("Kohlenhydrate")
                                    Text("\(daily.carbohydrates, specifier: "%.1f")")
                                }
                                .padding()
                                
                                VStack{
                                    
                                    Text("Protein")
                                    Text("\(daily.protein, specifier: "%.1f")")
                                    
                                }
                                .padding()
                                Spacer()
                                VStack{
                                    Text("Fett")
                                    Text("\(daily.fat, specifier: "%.1f")")
                                    
                                }
                                .padding(.trailing,40)
                                
                            }
                           
                            .font(.system(size: 15))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding(0)
                            .frame(width: 350, height: 75)
                            .background(Rectangle().fill(Color.green.opacity(0.3)).shadow(radius: 3).cornerRadius(15))
                            .multilineTextAlignment(.center)
                            
                            Spacer(minLength: 20)
                            //Wasser
                            VStack{
                                HStack{
                                    Text("Wasserzähler")
                                    Image(systemName: "drop.fill")
                                        .foregroundColor(.blue)
                                   
                                }
                                VStack{
                                    Text("Füge 250ml Wasser hinzu:")
                                        .padding(.top, 10)
                                    Button {
                                        let dailyCopied = daily.thaw()!
                                        try! realm.write{
                                            dailyCopied.waterCounter += 1
                                        }
                                    } label: {
                                        Image(systemName: "plus.circle")
                                            .font(.system(size: 30))
                                    }
                                    .padding(.top, 10)
                                    
                                        
                                }
                                WrappingHStack(1..<Int(daily.waterCounter + 1), id:\.self) { i in
                                    Image(systemName: "cup.and.saucer.fill")
                                        .font(.system(size: 30))
                                        .padding(.top, 10)
                                }.padding(.leading, 20)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            .frame(width: 350)
                            .background(Rectangle().fill(Color.green.opacity(0.3)).shadow(radius: 3).cornerRadius(15))
                            
                            Spacer(minLength: 20)
                            
                            //Verbrenner
                            VStack{
                                HStack{
                                    Text("Verbrenner")
                                    Image(systemName: "flame.fill")
                                        .foregroundColor(.red)
                                   
                                }
                                VStack{
                                    Text("Wie viele kcal hast du verbrennt?")
                                        .padding(.top, 10)
                                    HStack{
                                        Text("\(caloriesBurned, specifier: "%.1f")")
                                            .padding()
                                            .font(.system(size: 20))
                                        Button {
                                            let dailyCopied = daily.thaw()!
                                            try! realm.write{
                                                dailyCopied.caloriesBurned = caloriesBurned
                                            }
                                        } label: {
                                            Image(systemName: "plus.circle")
                                                .font(.system(size: 30))
                                        }
                                    }
                                    
                                    Slider(value: $caloriesBurned, in: 0...1000)
                                        .padding()
                                        
                                    
                                }
                                
                                
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            .frame(width: 350)
                            .background(Rectangle().fill(Color.green.opacity(0.3)).shadow(radius: 3).cornerRadius(15))
                        }
                    }
                }).onAppear(perform:{
                    Task{
                        await refreshUser()
                    }
                })
                .task {
                    await refreshUser()
                }
                .frame(maxWidth: .infinity, maxHeight: 750)
            
        
    }
    
    func resetProgress() {
        progress = 0
    }
    
    func updater(){
        progress = daily.caloriesEaten / currentuser.caloriesGoal
    }
    
    func refreshUser() async{
        if (currentuser.userId == "" && RealmManager.shared.user != nil) {
            try? realm.write{
                
                let user = UserAcc.currentuser
                let userA = UserAcc(firstName: user.firstName, lastName: user.lastName, sex: user.sex, birthdate: user.birthdate, bodyHeight: user.bodyHeight, goal: user.goal, weight: user.weight, weightGoal: 420, caloriesGoal: user.caloriesGoal, userId: RealmManager.shared.user!.id)
                
                $userAccs.append(userA)
                realm.refresh()
            }
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView(currentUser: UserAcc())
    }
}

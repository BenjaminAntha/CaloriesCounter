//
//  GesFoods.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI
import RealmSwift

struct FoodLogView: View {
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
        
    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    @ObservedResults(Daily.self) var dailys: Results<Daily>

    var list: RealmSwift.List<FoodProduct> = RealmSwift.List<FoodProduct>()
    
    @State var date = Date()
    
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
        NavigationView{
            VStack{
                HeaderView(dateAngezeigt: $date)
                Section{
                    VStack{
                        List{
                            Text("This is what you consumed Today")
                                .padding()
                                .fontWeight(.bold)
                            Section {
                                if daily.nutritions?.foodProduct != nil {
                                    ForEach(daily.nutritions?.foodProduct ?? list) { food in
                                        Text(food.Name)
                                    }
                                }
                            } header: {
                                HStack {
                                    Text("Food")
                                    Spacer()
                                    Text("Kcal")
                                }
                            }
                            
                            Section {
                                HStack {
                                    Text("Water")
                                    Spacer()
                                    Text(String(daily.waterCounter * 250))
                                }
                            } header: {
                                HStack {
                                    Text("Liquid")
                                    Spacer()
                                    Text("ml")
                                }
                            }
                            
                            Section {
                                HStack {
                                    Text("Verbrenner")
                                    Spacer()
                                    Text("\(daily.caloriesBurned, specifier: "%.1f")")
                                }
                            } header: {
                                HStack {
                                    Text("Verbrannt")
                                    Spacer()
                                    Text("Kcal")
                                }
                            }
                        }
                    }
                }
                .padding(.top, -10)
            }
        }
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView()
    }
}



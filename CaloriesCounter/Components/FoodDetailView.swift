//
//  FoodDetailsView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 06.12.22.
//

import SwiftUI
import RealmSwift

struct FoodDetailView: View {
    @ObservedRealmObject var currentUser: UserAcc
    @ObservedRealmObject var foodProduct: FoodProduct
    
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
    @ObservedResults(FoodProduct.self) var foods: Results<FoodProduct>
    @ObservedResults(Daily.self) var dailys: Results<Daily>
    @ObservedResults(Nutrition.self) var nutritions: Results<Nutrition>
        
    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    var date = Date.now.formatted(.dateTime.year().month().day())

    var body: some View {
        Text(foodProduct.Name)
        Button("Add your food") {
            print(currentUser.firstName)
            Task{
                await addDaily()
            }
        }
    }
    
    func addDaily() async{
        var checkIfDailyIsCreated = false
        var daily = Daily()
        for d in currentuser.daily {
            if d.date == date{
                checkIfDailyIsCreated = true
                daily = d
            }
        }
        
        let thawedUser = currentUser.thaw()!
        let realm = thawedUser.realm!
        let thawedFood = foodProduct.thaw()!
        
    
        if checkIfDailyIsCreated {
            let thawedDaily = daily.thaw()
            try! realm.write{
                thawedDaily?.nutritions?.foodProduct.append(thawedFood)
        
                thawedDaily?.caloriesEaten += Double(thawedFood.Kalorien)!
                thawedDaily?.carbohydrates += Double(thawedFood.Kohlenhydrate_verfügbar)!
                thawedDaily?.fat += Double(thawedFood.Fett)!
                thawedDaily?.protein += thawedFood.Protein
            }
        } else {
            try! realm.write{
                daily.nutritions?.foodProduct.append(thawedFood)
        
                daily.date = Date.now.formatted(.dateTime.year().month().day())
                daily.caloriesEaten += Double(thawedFood.Kalorien)!
                daily.carbohydrates += Double(thawedFood.Kohlenhydrate_verfügbar)!
                daily.fat += Double(thawedFood.Fett)!
                $currentUser.daily.append(daily)
            }
        }
        
    }
    
}

struct FoodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(currentUser: UserAcc() ,foodProduct: FoodProduct())
    }
}


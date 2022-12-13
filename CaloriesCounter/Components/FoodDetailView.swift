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
    @Environment(\.realm) var realm

    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    
    @State var amount: Double = 100
    var date = Date()

    var body: some View {
        VStack{
            HStack {
                Text(foodProduct.Name)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame( maxHeight: 35, alignment: .center)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
            }
            .padding()
            VStack{
                Text("Werte pro 100 gramm")
                    .padding(.top, 20)
                HStack{
                    VStack {
                        Text(foodProduct.Kalorien).font(.system(size: 18))
                        Text("Kalorien").font(.system(size: 12))
                        
                    }
                    .padding()
                    
                    VStack {
                        Text(foodProduct.Kohlenhydrate_verfügbar).font(.system(size: 18))
                        Text("Kohlenhydrate").font(.system(size: 12))
                        
                    }
                    .padding()
                    
                    VStack{
                        Text(String(foodProduct.Protein)).font(.system(size: 18))
                        Text("Protein").font(.system(size: 12))
                        
                    }
                    .padding()
                    Spacer()
                    VStack{
                        Text(foodProduct.Fett).font(.system(size: 18))
                        Text("Fett").font(.system(size: 12))
                    }
                    .padding()
                    
                }
                
                
            }
            .font(.system(size: 15))
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding(0)
            .frame(width: 350)
            .background(Rectangle().fill(Color.green.opacity(0.3)).shadow(radius: 3).cornerRadius(15))
            .multilineTextAlignment(.center)
            
        }
        
        Spacer()
        
        Text("Wie viel Gramm hast du gegessen:")
        Stepper("\(amount.formatted()) gramm", value: $amount, in: 0...10000, step: 50)
            .padding()
        
        HStack{
            Text("Kalorien: ").font(.system(size: 20))
            Text("\(amount / 100 * (Double(foodProduct.Kalorien) ?? 1) ,specifier: "%.1f")")
                .font(.system(size: 20))
        }
        
        
        Spacer()
        
        Button("Essen hinzufügen") {
            print(currentUser.firstName)
            Task{
                await addDaily()
            }
        }
        .padding()
        .background(.green)
        .clipShape(Capsule())
        Spacer()
    }
    
    func addDaily() async{
        var checkIfDailyIsCreated = false
        var daily = Daily()
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat =  "d. MMM. y"
        
        for d in currentuser.daily{
            if d.userId == currentuser.userId && d.date == formatter.string(from: date){
                checkIfDailyIsCreated = true
                daily = d
            }
        }
        
        let thawedFood = foodProduct.thaw()!
        let calories = amount / 100 * (Double(thawedFood.Kalorien) ?? 1)
        
        if checkIfDailyIsCreated {
            let thawedDaily = daily.thaw()!
            try! realm.write{
                thawedDaily.nutritions?.foodProduct.append(thawedFood)
                thawedDaily.nutritions?.amount = amount
                thawedDaily.caloriesEaten += calories
                thawedDaily.carbohydrates += Double(thawedFood.Kohlenhydrate_verfügbar)!
                thawedDaily.fat += Double(thawedFood.Fett)!
                thawedDaily.protein += thawedFood.Protein
            }
        } else {
            try! realm.write{
                daily.nutritions?.foodProduct.append(thawedFood)
                daily.nutritions?.amount = amount
                daily.date = formatter.string(from: date)
                daily.caloriesEaten += calories
                daily.carbohydrates += Double(thawedFood.Kohlenhydrate_verfügbar)!
                daily.fat += Double(thawedFood.Fett)!
                daily.userId = currentUser.userId
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


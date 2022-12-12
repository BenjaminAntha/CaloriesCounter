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
    
    var list: RealmSwift.List<FoodProduct> = RealmSwift.List<FoodProduct>()
    
    @State var date = Date()
    
    var daily: Daily {
        var k = Daily()
        for d in currentuser.daily {
            if d.date == date.formatted(.dateTime.year().month().day()){
                k = d
            }
        }
        return k
    }
    
    var body: some View {
        VStack{
            HeaderView(dateAngezeigt: $date)
            
            if daily.nutritions?.foodProduct != nil {
                List{
                    ForEach(daily.nutritions?.foodProduct ?? list) { food in
                        Text(food.Name)
                    }
                }.padding(2)
            } else {
                Text("You didn't eat anything today!")
            }
        }
        
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView()
    }
}



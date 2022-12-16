//
//  addFood.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI
import RealmSwift

struct AddFoodView: View {
    @State private var searchText = ""
    @ObservedRealmObject var currentUser: UserAcc
    @ObservedResults(FoodProduct.self) var foodProducts: Results<FoodProduct>
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
    @Environment(\.realm) var realm
    var currentuser: UserAcc? {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    @State var showEditAddFood = false
    @State private var searchFilter = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Section{
                    List(foodProducts, id: \._id) { foodProduct in
                        NavigationLink(destination: FoodDetailView(currentUser: currentUser ,foodProduct: foodProduct)) {
                            Text(foodProduct.Name)
                        }
                    }.searchable(text: $searchFilter,
                                 collection: $foodProducts,
                                 keyPath: \.Name)
                    .toolbar {
                        NavigationLink(destination: AddNewFood()) {
                            Image(systemName: "plus").foregroundColor(.green)
                        }
                    }
                }.task {
                    await refreshUser()
                }.padding(0)
            }
        }
    }
    
    func refreshUser() async{
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

struct addFoodView_Previews: PreviewProvider {
    static var previews: some View {
       AddFoodView(currentUser: UserAcc())
    }
}

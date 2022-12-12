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
    
    @State var showEditAddFood = false
        var body: some View {
            NavigationView {
                VStack {
                    
                    Button("edit", action: {
                        showEditAddFood.toggle()
                    })
                    NavigationLink("", destination: AddDummyFoodView(), isActive: $showEditAddFood)
                    Text("")
                        .searchable(text: $searchText)
                        .navigationTitle("Add your Food")
                    
                    /*
                    List(foodProducts, id: \._id) { foodProduct in
                            Text(foodProduct.Name)
                    }
                    */
                    
                    List{
                        ForEach(foodProducts) { foodProduct in
                            NavigationLink(destination: FoodDetailView(currentUser: currentUser ,foodProduct: foodProduct)) {
                                Text(foodProduct.Name)
                            }
                        }
                    }.navigationBarTitle("Back")
                }
            }
        }
}

struct addFoodView_Previews: PreviewProvider {
    static var previews: some View {
       AddFoodView(currentUser: UserAcc())
    }
}

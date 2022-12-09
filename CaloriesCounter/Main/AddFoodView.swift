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
    @ObservedResults(FoodProduct.self) var foodProducts: Results<FoodProduct>
    @State var showEditAddFood = false
        var body: some View {
            NavigationView {
                VStack {
                
                    Section{
                        Button("add Food", action: {
                            showEditAddFood.toggle()
                        })
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(.green)
                        NavigationLink("", destination: AddDummyFoodView()
                            , isActive: $showEditAddFood)
                        Text("")
                            .searchable(text: $searchText)
                            .navigationTitle("Add your Food")
                        
                        List(foodProducts, id: \._id) { foodProduct in
                                    Text(foodProduct.Name)
                        }
                    }
                    
                }
            }
        }
}

struct addFoodView_Previews: PreviewProvider {
    static var previews: some View {
       AddFoodView()
    }
}

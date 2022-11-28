//
//  FoodProductsView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 27.11.22.
//

import SwiftUI
import RealmSwift

struct ListFoodProductsView: View {
    
    @ObservedResults(FoodProduct.self) var foodProducts: Results<FoodProduct>
    
    var body: some View {
        List(foodProducts, id: \._id) { foodProduct in
            Text(foodProduct.Name)
        }
    }
}

struct FoodProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodProductsView()
    }
}

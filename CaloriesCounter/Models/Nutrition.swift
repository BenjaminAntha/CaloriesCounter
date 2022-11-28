//
//  Nutrition.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 27.11.22.
//

import Foundation
import RealmSwift

class Nutrition: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var foodProduct: List<FoodProduct> = List<FoodProduct>()
    @Persisted var amount: Double = 0
}

//
//  Daily.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 27.11.22.
//

import Foundation
import RealmSwift

class Daily: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var caloriesLeft: Double = 0
    @Persisted var caloriesEaten: Double = 0
    @Persisted var caloriesBurned: Double = 0
    @Persisted var carbohydrates: Double = 0
    @Persisted var protein: Date
    @Persisted var fat: Double = 0
    @Persisted var waterCounter: Double = 0
    @Persisted var nutrition: List<Nutrition> = List<Nutrition>()
}

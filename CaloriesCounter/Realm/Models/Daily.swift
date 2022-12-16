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
    @Persisted var protein: Double = 0
    @Persisted var fat: Double = 0
    @Persisted var waterCounter: Double = 0
    @Persisted var nutrition: List<Nutrition> = List<Nutrition>()
    @Persisted var date: String = ""
    @Persisted var userId: String = ""
    @Persisted var nutritions: Nutrition? = Nutrition()

    
    
    convenience init( userId: String,caloriesLeft: Double, caloriesEaten: Double, caloriesBurned: Double, carbohydrates: Double, protein: Double, fat: Double, waterCounter: Double, nutrition: List<Nutrition>, date: String, nutritions: Nutrition) {
        self.init()
        self.userId = userId
        self.caloriesLeft = caloriesLeft
        self.caloriesEaten = caloriesEaten
        self.caloriesBurned = caloriesBurned
        self.carbohydrates = carbohydrates
        self.protein = protein
        self.fat = fat
        self.waterCounter = waterCounter
        self.nutrition = nutrition
        self.date = date
        self.nutritions = nutritions
    }
}

//
//  User.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 27.11.22.
//

import Foundation
import RealmSwift

enum Goal: String, CaseIterable, PersistableEnum {
    case loseWeight = "Lose weight"
    case gainWeight = "Gain weight"
    case holdWeight = "Hold weight"
}

class UserAcc: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted var sex: String = ""
    @Persisted var birthdate: Date
    @Persisted var bodyHeight: Double = 0
    @Persisted var goal: Goal = Goal.holdWeight
    @Persisted var weight: Double = 0
    @Persisted var weightGoal: String = ""
    @Persisted var caloriesGoal: Double = 0
    @Persisted var daily: List<Daily> = List<Daily>()
}

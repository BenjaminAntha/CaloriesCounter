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
    
    static let currentuser = UserAcc()
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var userId: String = ""
    @Persisted var firstName: String = "not set"
    @Persisted var lastName: String = "not set"
    @Persisted var sex: String = ""
    @Persisted var birthdate: Date
    @Persisted var bodyHeight: Double = 0
    @Persisted var goal: Goal = Goal.holdWeight
    @Persisted var weight: Double = 0
    @Persisted var weightGoal: String = "not set"
    @Persisted var caloriesGoal: Double = 0
    @Persisted var daily: List<Daily> = List<Daily>()
    
    convenience init(firstName: String, lastName: String, sex: String, birthdate: Date, bodyHeight: Double, goal: Goal, weight: Double, weightGoal: String, caloriesGoal: Double, userId: String) {
        self.init()
        self.userId = userId
        self.firstName = firstName
        self.lastName = lastName
        self.sex = sex
        self.birthdate = birthdate
        self.bodyHeight = bodyHeight
        self.goal = goal
        self.weight = weight
        self.weightGoal = weightGoal
        self.caloriesGoal = caloriesGoal
    }
}

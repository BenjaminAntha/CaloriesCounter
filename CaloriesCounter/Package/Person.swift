//
//  Person.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 26.11.22.
//

import Foundation

import SwiftUI

struct Person {
    var name: String
    var height: Double
    var weight: Double
    var age: Int
    var dailyIntake: Int
    
    init(name: String, height: Double, weight: Double, age: Int, dailyIntake: Int) {
        self.name = name
        self.height = height
        self.weight = weight
        self.age = age
        self.dailyIntake = dailyIntake
    }
}

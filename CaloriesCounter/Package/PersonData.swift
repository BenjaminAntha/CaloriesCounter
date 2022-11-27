//
//  Day.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 27.11.22.
//

import Foundation
import SwiftUI

struct PersonData {
    var date: String
    var caloriesPerDay: Int
    var actualCalories: Int
    var Food: [Food] = []
    
    init(date: String, caloriesPerDay: Int, actualCalories: Int, Food: [Food]) {
        self.date = date
        self.caloriesPerDay = caloriesPerDay
        self.actualCalories = actualCalories
        self.Food = Food
    }
    
    
    
    }
    


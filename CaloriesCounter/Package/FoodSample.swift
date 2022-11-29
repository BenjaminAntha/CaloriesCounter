//
//  FoodSample.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI

class FoodSample: Identifiable, Codable {
    var id = UUID()
    var name = "apple"
    var calories = 0
    fileprivate(set) var isContacted = false
    
}

@MainActor class FoodSamples: ObservableObject {
    @Published var items: [FoodSample]
    
    
    init() {
        if let data  = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([FoodSample].self, from: data) {
                items = decoded
                return
            }
        }
        
        
        //no saved Data!
        items = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
    func toggle(_ group: FoodSample){
        objectWillChange.send()
        group.isContacted.toggle()
        save()
    }
}

//
//  foodProducts.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 23.11.22.
//

import Foundation
import RealmSwift

class FoodProduct: Object, Identifiable, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var Name: String = ""
    @Persisted var Synonyme: String = ""
    @Persisted var Kategorie: String = ""
    @Persisted var Bezugseinheit: String = ""
    @Persisted var Kilojoule: String = ""
    @Persisted var Fett: String = ""
    @Persisted var Kalorien: String = ""
    @Persisted var Cholesterin: String = ""
    @Persisted var Fettsäuren_gesättigt: String = ""
    @Persisted var Kohlenhydrate_verfügbar: String = ""
    @Persisted var Nahrungsfasern: String = ""
    @Persisted var Zucker: String = ""
    @Persisted var Calcium: String = ""
    @Persisted var Eisen: String = ""
    @Persisted var Kalium: String = ""
    @Persisted var Magnesium: String = ""
    @Persisted var Natrium: String = ""
    @Persisted var Protein: Double = 0
    @Persisted var Salz: String = ""
    @Persisted var Vitamin_B1: String = ""
    @Persisted var Vitamin_B12: String = ""
    @Persisted var Vitamin_B2: String = ""
    @Persisted var Vitamin_B6: String = ""
    @Persisted var Vitamin_C: String = ""
    @Persisted var Vitamin_D: String = ""
    @Persisted var Vitamin_E: String = ""
    @Persisted var Wasser: String = ""
    @Persisted var Zink: String = ""
    @Persisted var amount: Double = 1
    
    
    convenience init(Name: String, Synonyme: String, Kategorie: String, Bezugseinheit: String, Kilojoule: String, Fett: String, Kalorien: String, Cholesterin: String, Fettsäuren_gesättigt: String, Kohlenhydrate_verfügbar: String, Nahrungsfasern: String, Zucker: String, Calcium: String, Eisen: String, Kalium: String, Magnesium: String, Natrium: String, Protein: Double, Salz: String, Vitamin_B1: String, Vitamin_B12: String, Vitamin_B2: String, Vitamin_B6: String, Vitamin_C: String, Vitamin_D: String, Vitamin_E: String, Wasser: String, Zink: String) {
        self.init()
        self.Name = Name
        self.Synonyme = Synonyme
        self.Kategorie = Kategorie
        self.Bezugseinheit = Bezugseinheit
        self.Kilojoule = Kilojoule
        self.Fett = Fett
        self.Kalorien = Kalorien
        self.Cholesterin = Cholesterin
        self.Fettsäuren_gesättigt = Fettsäuren_gesättigt
        self.Kohlenhydrate_verfügbar = Kohlenhydrate_verfügbar
        self.Nahrungsfasern = Nahrungsfasern
        self.Zucker = Zucker
        self.Calcium = Calcium
        self.Eisen = Eisen
        self.Kalium = Kalium
        self.Magnesium = Magnesium
        self.Natrium = Natrium
        self.Protein = Protein
        self.Salz = Salz
        self.Vitamin_B1 = Vitamin_B1
        self.Vitamin_B12 = Vitamin_B12
        self.Vitamin_B2 = Vitamin_B2
        self.Vitamin_B6 = Vitamin_B6
        self.Vitamin_C = Vitamin_C
        self.Vitamin_D = Vitamin_D
        self.Vitamin_E = Vitamin_E
        self.Wasser = Wasser
        self.Zink = Zink
    }
}

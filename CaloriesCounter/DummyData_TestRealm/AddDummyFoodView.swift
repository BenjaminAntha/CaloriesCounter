//
//  AddDummyFoodView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 29.11.22.
//

import SwiftUI
import RealmSwift

struct AddDummyFoodView: View {
    @ObservedResults(FoodProduct.self) var foodProducts: Results<FoodProduct>
    @State var name: String = ""
    @State var calories: String = ""
    @State var kohlenhydrate: String = ""
    @State var protein: Double = 0
    @State var fett: String = ""
    
    
    var body: some View {
        
        
        NavigationView {
            
                    VStack {
                        Form{
                            
                            TextField("Name", text: $name)
                            TextField("Kalorien", text: $calories)
                            TextField("Kohlenhydrate", text: $kohlenhydrate)
                            TextField("Fett", text: $fett)
                            TextField("", value: $protein, format: .number)
                            
                        }
                        .overlay(Button(action: {
                            addProduct(name: name, Kalorien: calories, Kohlenhydrate: kohlenhydrate, Protein: protein, Fett: fett)
                            name = ""
                            calories = ""
                            kohlenhydrate = ""
                            fett = ""
                            protein = 0
                            
                        }, label: {
                          Text("add Food")
                        })
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(.green))
                        
                        
                    }
 
        }
        
    }
    
    func addProduct(name: String, Kalorien: String, Kohlenhydrate: String, Protein: Double, Fett: String){
        
        print("hello")
        let foodProduct = FoodProduct(Name: name, Synonyme: "", Kategorie: "", Bezugseinheit: "", Kilojoule: "sadkf", Fett: Fett, Kalorien: Kalorien, Cholesterin: "", Fettsäuren_gesättigt: "", Kohlenhydrate_verfügbar: Kohlenhydrate, Nahrungsfasern: "", Zucker: "", Calcium: "", Eisen: "", Kalium: "", Magnesium: "", Natrium: "12", Protein: Protein, Salz: "", Vitamin_B1: "", Vitamin_B12: "*", Vitamin_B2: "", Vitamin_B6: "", Vitamin_C: "", Vitamin_D: "", Vitamin_E: "", Wasser: "", Zink: "");
        $foodProducts.append(foodProduct)
    }
}

struct AddDummyFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddDummyFoodView()
    }
}

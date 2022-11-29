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
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: addProduct){
                    Text("Add Product")
                }
                ListFoodProductsView()
            }.navigationTitle("FOODPRODUCTS")
            
            
            
        }
    }
    
    func addProduct() {
        print("hello")
        let foodProduct = FoodProduct(Name: "Test", Synonyme: "", Kategorie: "", Bezugseinheit: "", Kilojoule: "sadkf", Fett: "", Kalorien: "", Cholesterin: "", Fettsäuren_gesättigt: "", Kohlenhydrate_verfügbar: "", Nahrungsfasern: "", Zucker: "", Calcium: "", Eisen: "", Kalium: "", Magnesium: "", Natrium: "12", Protein: 123, Salz: "", Vitamin_B1: "", Vitamin_B12: "*", Vitamin_B2: "", Vitamin_B6: "", Vitamin_C: "", Vitamin_D: "", Vitamin_E: "", Wasser: "", Zink: "");
        $foodProducts.append(foodProduct)
        
        
    }
}

struct AddDummyFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddDummyFoodView()
    }
}

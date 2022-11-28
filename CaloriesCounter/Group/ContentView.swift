//
//  ContentView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 21.11.22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
<<<<<<< HEAD:CaloriesCounter/Group/ContentView.swift
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
=======
    var body: some View {
<<<<<<< HEAD:CaloriesCounter/ContentView.swift
        HeaderView()
        FooterView()
            .frame(width: .infinity, height: .infinity)
=======
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
>>>>>>> main:CaloriesCounter/ContentView.swift
>>>>>>> main:CaloriesCounter/Group/ContentView.swift
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

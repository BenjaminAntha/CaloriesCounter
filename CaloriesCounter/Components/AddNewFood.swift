//
//  AddDummyFoodView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 29.11.22.
//

import SwiftUI
import RealmSwift

struct AddNewFood: View {
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
                    Section(footer:
                        Button(action: {
                            addProduct(name: name, Kalorien: calories, Kohlenhydrate: kohlenhydrate, Protein: protein, Fett: fett)
                            name = ""
                            calories = ""
                            kohlenhydrate = ""
                            fett = ""
                            protein = 0
                            
                        }, label: {
                            Text("Essware hinzufügen")
                        })
                        .padding(.top, 50)
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .tint(.green)
                        .frame(maxWidth: .infinity, alignment: .center)){
                        Text("Werte pro 100 gramm:")
                                .listRowSeparator(.hidden)
                        VStack{
                            Text("Name: ").frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Name", text: $name)
                        }
                        
                        VStack{
                            Text("Kalorien: ").frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Kalorien", text: $calories)
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                        }
                        
                        VStack{
                            Text("Kohlenhydrate: ").frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Kohlenhydrate", text: $kohlenhydrate)
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                        }
                        
                        VStack{
                            Text("Fett: ").frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Fett", text: $fett)
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                        }
                        
                        VStack{
                            Text("Protein: ").frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("Protein", value: $protein, format: .number)
                                .textContentType(.oneTimeCode)
                                .keyboardType(.numberPad)
                        }
                       
                    }
                    
                }
                
            }
        }.navigationTitle("Essware hinzufügen")
        
    }
    
    func addProduct(name: String, Kalorien: String, Kohlenhydrate: String, Protein: Double, Fett: String){
        
        let foodProduct = FoodProduct(Name: name, Synonyme: "", Kategorie: "", Bezugseinheit: "", Kilojoule: "sadkf", Fett: Fett, Kalorien: Kalorien, Cholesterin: "", Fettsäuren_gesättigt: "", Kohlenhydrate_verfügbar: Kohlenhydrate, Nahrungsfasern: "", Zucker: "", Calcium: "", Eisen: "", Kalium: "", Magnesium: "", Natrium: "12", Protein: Protein, Salz: "", Vitamin_B1: "", Vitamin_B12: "*", Vitamin_B2: "", Vitamin_B6: "", Vitamin_C: "", Vitamin_D: "", Vitamin_E: "", Wasser: "", Zink: "");
        $foodProducts.append(foodProduct)
    }
}

struct AddNewFood_Previews: PreviewProvider {
    static var previews: some View {
        AddNewFood()
    }
}

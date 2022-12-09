//
//  GesFoods.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI

struct FoodLogView: View {
    
    @State var text: String = UserDefaults.standard.string(forKey: "TEXT_KEY") ?? ""
    @State var inputText: String = ""
    
    var body: some View {
        NavigationView{

            VStack{
                HeaderView()
                    .frame(maxWidth: .infinity, maxHeight: 170)
                    .offset(x: 0, y: -17)
                
                
                Section{
                    VStack{
                        Text("This is what you ate Today")
                            .padding()
                        
                        List{
                            Section {
                                
                                HStack {
                                    Text("Apple")
                                    Spacer()
                                    Text("300")
                                }
                            } header: {
                                HStack {
                                    Text("Food")
                                    Spacer()
                                    Text("Kcal")
                                }
                            }
                            Section {
                                
                                HStack {
                                    Text("Water")
                                    Spacer()
                                    Text("1000")
                                }
                            } header: {
                                HStack {
                                    Text("Liquid")
                                    Spacer()
                                    Text("ml")
                                }
                            }
                            
                            
                        }
                        

                    }
                }
                
                
            }
            
        }
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView()
    }
}



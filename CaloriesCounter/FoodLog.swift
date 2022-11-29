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
        
        Form{
            Section(header: Text("input:")){
                TextField("Add some text here", text: $inputText)
            }
            
            Section(header: Text("letter count: ")){
                let charCount = inputText.filter { $0 != " " }.count
                
                if (charCount > 30){
                    Text(String(charCount)).foregroundColor(.red)
                } else {
                    inputText == "" ? Text("Empty") : Text(String(charCount))
                }
            }
            Section(header: Text("Actions:")) {
                Button("Save Data") {
                    UserDefaults.standard.set(inputText, forKey: "TEXT_KEY")
                    text = inputText
                    print("Saved value: \(inputText)")
                }
            }
            
            Section(header: Text("Saved Data")){
                
                Text(text).lineLimit(10)
                
            }
        }
        .padding()
        
        
       
        
        
    }
}

struct FoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogView()
    }
}



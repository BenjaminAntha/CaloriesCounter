//
//  ContentView.swift
//  CaloriesCounter
//
//  Created by Benjamin Anthamatten on 21.11.22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HeaderView()
        FooterView()
            .frame(width: .infinity, height: .infinity)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

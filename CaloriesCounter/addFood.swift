//
//  addFood.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import SwiftUI

struct addFoodView: View {
    @State private var searchText = ""

        var body: some View {
            NavigationView {
                Text("")
                    .searchable(text: $searchText)
                    .navigationTitle("Add your Food")
            }
        }
}

struct addFoodView_Previews: PreviewProvider {
    static var previews: some View {
        addFoodView()
    }
}

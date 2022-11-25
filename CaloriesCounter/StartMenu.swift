//
//  StartMenu.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI

struct StartMenuView: View {
    var body: some View {
        VStack {
            Image(systemName: "ball")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Text")
        }
        .padding()
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}

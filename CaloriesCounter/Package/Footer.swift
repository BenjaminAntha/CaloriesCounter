//
//  Footer.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI

//testölajfhöalfnaöslnadfas

struct FooterView: View {
    var body: some View {
        TabView {
            Text("View1")
                .tabItem {
                    Label("Kalender", systemImage: "calendar")
                }
            Text("View2")
                .tabItem {
                    Label("Statistik", systemImage: "chart.bar.xaxis")
                }
            Text("View3")
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            Text("View4")
                .tabItem {
                    Label("Essen", systemImage: "fork.knife")
                }
            Text("View5")
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
        
    }
    }

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
    }
}

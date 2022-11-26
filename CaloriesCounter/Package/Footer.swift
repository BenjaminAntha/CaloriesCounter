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
                StartMenuView()
                    .tabItem {
                        Label("Kalender", systemImage: "calendar")
                    }
                StatsView()
                    .tabItem {
                        
                        Label("Statistik", systemImage: "chart.bar.xaxis")
                    }
                addFoodView()
                    .tabItem {
                        Label("Add", systemImage: "plus")
                    }
                FoodLogView()
                    .tabItem {
                        Label("Essen", systemImage: "fork.knife")
                    }
                ProfilView()
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
            }
            
            .padding()
            
        }
    }

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}

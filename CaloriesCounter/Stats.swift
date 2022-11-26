//
//  Stats.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import Charts
import SwiftUI

struct StatsView: View {
    var body: some View {
        let today: Date = Date.now
        let yesterday: Date = today-1;
        
        //let data: [ToyShape] = [
       //     .init(day: today , calories: 300),
     //       .init(day: yesterday, calories:  400),
   //
 //       ]
        
        let currentWeek: [CaloriesPerDay] = [
            CaloriesPerDay(day: "20220717", calories: 4200),
            CaloriesPerDay(day: "20220718", calories: 3000),
            CaloriesPerDay(day: "20220719", calories: 2800),
            CaloriesPerDay(day: "20220720", calories: 2000),
            CaloriesPerDay(day: "20220721", calories: 2000),
            CaloriesPerDay(day: "20220722", calories: 1980),
            CaloriesPerDay(day: "20220723", calories: 1900)
        ]
        
        VStack {
                    GroupBox ( "Bar Chart - Calorie Count") {
                        Chart {
                            ForEach(currentWeek) {
                                BarMark(
                                    x: .value("Week Day", $0.day, unit: .day),
                                    y: .value("Step Count", $0.calories)
                                )
                            }
                        }
                    }
                    .padding()
                    
                    
                }
            
                
                
        
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}

struct CaloriesPerDay: Identifiable {
    var day: Date
    var calories: Double
    var id = UUID()
    
    init(day: String, calories: Double) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            
            self.day = formatter.date(from: day) ?? Date.distantPast
            self.calories = calories
        }
}



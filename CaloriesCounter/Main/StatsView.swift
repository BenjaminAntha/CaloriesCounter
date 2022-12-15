//
//  Stats.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation
import Charts
import SwiftUI
import RealmSwift

struct StatsView: View {
    @State var date = Date()
    @ObservedResults(UserAcc.self) var userAccs: Results<UserAcc>
        
    var currentuser: UserAcc {
        userAccs.first(where: ({$0.userId == RealmManager.shared.user?.id } )) ?? UserAcc()
    }
    
    var daily: Daily {
        var k = Daily()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat =  "d. MMM. y"
        let dateEdited = formatter.string(from: date)
        for d in currentuser.daily {
            if  d.userId == currentuser.userId && d.date == dateEdited{
                k = d
            }
        }
        return k
    }
    
    @State var currentWeek: [CaloriesPerDay] = [CaloriesPerDay(day: "", calories: 0)]
    
    var body: some View {
        VStack {
            HeaderView(dateAngezeigt: $date).onChange(of: date) { d in
                getWeek()
            }
            GroupBox ( "Bar Chart - Calorie Count") {
                Chart {
                    
                    ForEach(currentWeek) {
                        BarMark(
                            x: .value("Week Day", $0.day, unit: .day),
                            y: .value("Step Count", $0.calories)
                        )
                    }
                    RuleMark(y: .value("Goal", currentuser.caloriesGoal))
                        .foregroundStyle(.orange)
                        .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                        .annotation(alignment: .leading){
                            Text("Goal")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }
                }
            }
            .padding()
        }.onAppear(perform: getWeek)
    }
    
    func getWeek(){
        var dateComponent = DateComponents()
        
        let dateFormatter = DateFormatter()
        let d: Date
        
        // Set Date Format
        dateFormatter.dateFormat = "d. MMM. y"
        dateFormatter.locale = Locale(identifier: "en")

        if daily.date == "" {
            d = date
        }else{
            d = dateFormatter.date(from: daily.date)!
        }
        
        
        dateComponent.day = -1
        var datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let yesterday = getDaily(datePlaceholder: datePlaceholder)
        
        dateComponent.day = -2
        datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let byesterday = getDaily(datePlaceholder: datePlaceholder)
        
        dateComponent.day = -3
        datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let bbyesterday = getDaily(datePlaceholder: datePlaceholder)
        
        dateComponent.day = -4
        datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let bbbyesterday = getDaily(datePlaceholder: datePlaceholder)
        
        dateComponent.day = -5
        datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let bbbbyesterday = getDaily(datePlaceholder: datePlaceholder)
        
        
        dateComponent.day = -6
        datePlaceholder = Calendar.current.date(byAdding: dateComponent, to: d)!
        let bbbbbyesterday = getDaily(datePlaceholder: datePlaceholder)
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat =  "d. MMM. y"
        let dateEdited = formatter.string(from: date)
        
        if daily.date == "" {
            currentWeek = [
                        CaloriesPerDay(day: bbbbbyesterday.date, calories: bbbbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbbbyesterday.date, calories: bbbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbbyesterday.date, calories: bbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbyesterday.date, calories: bbyesterday.caloriesEaten),
                        CaloriesPerDay(day: byesterday.date, calories: byesterday.caloriesEaten),
                        CaloriesPerDay(day: yesterday.date, calories: yesterday.caloriesEaten),
                        CaloriesPerDay(day: dateEdited, calories: daily.caloriesEaten)
                    ]
        }else{
            currentWeek = [
                        CaloriesPerDay(day: bbbbbyesterday.date, calories: bbbbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbbbyesterday.date, calories: bbbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbbyesterday.date, calories: bbbyesterday.caloriesEaten),
                        CaloriesPerDay(day: bbyesterday.date, calories: bbyesterday.caloriesEaten),
                        CaloriesPerDay(day: byesterday.date, calories: bbyesterday.caloriesEaten),
                        CaloriesPerDay(day: yesterday.date, calories: yesterday.caloriesEaten),
                        CaloriesPerDay(day: daily.date, calories: daily.caloriesEaten)
                    ]
        }
    }
    
    func getDaily(datePlaceholder: Date) -> Daily{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat =  "d. MMM. y"
        let dateEdited = formatter.string(from: datePlaceholder)
        for b in currentuser.daily {
            if b.date == dateEdited{
                return b
            }
        }
        let defaultDaily = Daily()
        defaultDaily.date = dateEdited
        return defaultDaily
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
        formatter.dateFormat = "d. MMM. y"
        formatter.locale = Locale(identifier: "en")

        self.day = formatter.date(from: day) ?? Date.distantPast
        self.calories = calories
    }
}



//
//  Datum.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 27.11.22.
//

import Foundation
import SwiftUI

class Datum: ObservableObject{
//    @State var progress: Double = 0
//    @Binding var dateAngezeigt: Date
//    @State var Startday : Date = Date()
//    @State var timeInterval : Double = 0
    
    
    var dateAngezeigt: Date = Date()
    @Published var timeInterval : Double = 0
    
    init() {
        
        
    }
    
    
    func changeDateBack(){
        timeInterval = timeInterval - 86400
        dateAngezeigt = Date().addingTimeInterval(timeInterval)
        print("date back")
        
    }
    func changeDateForward(){
        timeInterval = timeInterval + 86400
        dateAngezeigt = Date().addingTimeInterval(timeInterval)
        print("date forward")
    }
}

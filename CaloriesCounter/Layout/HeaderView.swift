//
//  Header.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @Binding var dateAngezeigt: Date
    
    var body: some View {
        Form{
            VStack {
                HStack {
                    Text("Kalorienzähler").multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: 200, maxHeight: 35, alignment: .center)
                }
                
                HStack{
                    Button() {
                        var dateComponent = DateComponents()
                        dateComponent.day = -1
                        dateAngezeigt = Calendar.current.date(byAdding: dateComponent, to: dateAngezeigt)!
                    }label: {
                        Image(systemName: "arrow.left")
                    }.buttonStyle(.borderedProminent)
                    
                    if dateAngezeigt.formatted(.dateTime.year().month().day()) == Date.now.formatted(.dateTime.year().month().day()){
                        Text("Heute")
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                    }else {
                        Text(dateAngezeigt, format: .dateTime.day().month().year())
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                    }
                   
                    Button() {
                        var dateComponent = DateComponents()
                        dateComponent.day = 1
                        dateAngezeigt = Calendar.current.date(byAdding: dateComponent, to: dateAngezeigt)!
                    }label: {
                        Image(systemName: "arrow.right")
                    }.buttonStyle(.borderedProminent)
                }
            }
            
        }
        .frame(minWidth: 300, maxWidth: 5000, minHeight: 100, maxHeight: 150)
    }
}



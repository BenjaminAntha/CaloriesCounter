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
        Color.green.opacity(1.5)
            .ignoresSafeArea()
            .overlay(
                VStack {
                    HStack {
                        Text("Kalorienzähler").multilineTextAlignment(.center)
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 35, alignment: .center)
                            .fontWeight(.bold)
                    }
                    
                    HStack{
                        Button(action: {changeDateBack()}) {
                            Image(systemName: "arrow.left")
                        }.buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                        .tint(.green)
                        .padding()
                        
                        if dateAngezeigt.formatted(.dateTime.year().month().day()) == Date.now.formatted(.dateTime.year().month().day()){
                            Text("Heute")
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                                .fontWeight(.bold)
                        }else {
                            Text(dateAngezeigt, format: .dateTime.day().month().year())
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                                .fontWeight(.bold)
                        }
                            
                        Button(action: {changeDateForward()}) {
                            Image(systemName: "arrow.right")
                        }.buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                        .tint(.green)
                        .padding()
                    }
                }
            )      
        .frame(maxWidth: .infinity, maxHeight: 190)
    }
    
    func changeDateBack(){
        var dateComponent = DateComponents()
        dateComponent.day = -1
        dateAngezeigt = Calendar.current.date(byAdding: dateComponent, to: dateAngezeigt)!
        
    }
    
    func changeDateForward(){
        var dateComponent = DateComponents()
        dateComponent.day = 1
        dateAngezeigt = Calendar.current.date(byAdding: dateComponent, to: dateAngezeigt)!
    }
}



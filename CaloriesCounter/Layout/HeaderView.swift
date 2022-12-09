//
//  Header.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI

struct HeaderView: View {
   
    
    @State var dateAngezeigt: Date = Date()
    @State var timeInterval : Double = 0
    
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
                        changeDateBack()
                    }label: {
                        Image(systemName: "arrow.left")
                    }.buttonStyle(.borderedProminent)
                    
                    Text(dateAngezeigt, format: .dateTime.day().month().year())
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                    Button() {
                        changeDateForward()
                    }label: {
                        Image(systemName: "arrow.right")
                    }.buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 170)
     
        }
        
       
    
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

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}



//
//  Header.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    @State var dateAngezeigt = Datum()
    
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
                        dateAngezeigt.changeDateBack()
                    }label: {
                        Image(systemName: "arrow.left")
                    }.buttonStyle(.borderedProminent)
                    
                    Text(dateAngezeigt.dateAngezeigt, format: .dateTime.day().month().year())
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 35, alignment: .center)
                    Button() {
                        dateAngezeigt.changeDateForward()
                    }label: {
                        Image(systemName: "arrow.right")
                    }.buttonStyle(.borderedProminent)
                }
            }
            
        }
        .frame(minWidth: 300, maxWidth: 5000, minHeight: 100, maxHeight: 150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}



//
//  Header.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 21.11.22.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var body: some View {
        Form{
            
            VStack {
                HStack {
                    Text("Kalorienzähler").multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                HStack{
                    Label("", systemImage: "arrow.left")
                    Text(Date.now, format: .dateTime.day().month().year())
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    Label("", systemImage: "arrow.right")
                }
            }
        }
        
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

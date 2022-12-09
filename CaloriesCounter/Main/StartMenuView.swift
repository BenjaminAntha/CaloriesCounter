//
//  StartMenu.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI

struct StartMenuView: View {
    @State var progress: Double = 50
    
    
    var body: some View {
        Color.green.opacity(0.2)
            .ignoresSafeArea()
            .overlay(
                
                VStack {
                HeaderView()
                    .frame(maxWidth: .infinity, maxHeight: 170)
                    .offset(x: 0, y: -128)
                    
                        
                        ZStack {
                            // 2
                            ProgressCircleView(progress: progress)
                            
                            // 3
                            Text("\(progress * 100, specifier: "%.0f")")
                                .font(.largeTitle)
                                .bold()
                        }
                        .frame(width: 200, height: 200)
                        .padding()
                        
        
            
                HStack{
                    VStack {
                        Text("Kohlenhydrate")
                        Text("34534")
                    }
                    .padding()
                    Spacer(minLength: 1)
                    VStack{
                        
                        Text("Protein")
                        Text("23442")
                        
                    }
                    .padding()
                    Spacer()
                    VStack{
                        Text("Fett")
                        Text("23442")
                        
                    }
                    .padding()
                }
                
                    .fontWeight(.light)
                    .font(.system(size: 15))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(0)
                    .frame(width: 300, height: 75)
                    .background(Rectangle().fill(Color.white).shadow(radius: 3))
                    .offset(x:0,y: 50)
                    .multilineTextAlignment(.center)
                    
                
                    
            })
        
        .frame(maxWidth: .infinity, maxHeight: 750)
        
        
        
        
        
       
    }
        
    
    func resetProgress() {
        progress = 0
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}

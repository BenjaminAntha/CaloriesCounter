//
//  StartMenu.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI

struct StartMenuView: View {
    @State var progress: Double = 0
    var body: some View {
    
        VStack {
            HeaderView()
                    Spacer()
                    ZStack {
                        // 2
                        ProgressCircleView(progress: progress)
                        // 3
                        Text("\(progress * 100, specifier: "%.0f")")
                            .font(.largeTitle)
                            .bold()
                    }.frame(width: 200, height: 200)
                HStack {
                            // 4
                            Slider(value: $progress, in: 0...1)
                            // 5
                            Button("Reset") {
                                resetProgress()
                            }.buttonStyle(.borderedProminent)
                        }
                    
    
        Spacer()
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
                
                .multilineTextAlignment(.center)
                
                
        }
        .padding()
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

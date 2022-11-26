//
//  ProgressCircle.swift
//  CaloriesCounter
//
//  Created by Raphael Beck on 25.11.22.
//

import Foundation

import SwiftUI

struct ProgressCircleView: View {
    
    let progress: Double
    var body: some View {
        Circle()
                .stroke( // 1
                    Color.green.opacity(0.5),
                    lineWidth: 25
                )
        Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.green,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        // 1
                        .animation(.easeOut, value: progress)
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress: 100)
    }
}

//
//  CircleProgressView.swift
//  
//
//  Created by Austin Xu on 2024/2/19.
//

import SwiftUI

struct CircleProgressView: View {
    
    @Binding var text: String
    @Binding var progress: Double
    @Binding var color: Color
    var computedProgress: Double{
        self.progress * 0.75
    }

    var body: some View {
        ZStack {
            // Circle for text
            Circle()
                .stroke(
                    Color.white.opacity(0.5),
                    lineWidth: 20
                )
                .overlay(
                    Text(text)
                        .font(.title)
                )
            
            // Background circle
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(
                    color.opacity(0.5),
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                    
                )
                .rotationEffect(.degrees(135))
            
            // Progress Cirlce
            Circle() // 2
                .trim(from: 0, to: computedProgress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(135))
                .animation(.easeOut, value: computedProgress)
            
        }
    }
}

#Preview {
    CircleProgressView(text: .constant("Coffee"),progress: .constant(0.6), color: .constant(Color.blue))
}

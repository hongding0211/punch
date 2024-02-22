//
//  PunchButton.swift
//  Punch
//
//  Created by hong on 2024/2/22.
//

import SwiftUI
import FluidGradient

struct PunchButton: View {
    let isPause: Bool
    let onPress: () -> Void
    
    struct ButtonBackground: View {
        let active: Bool
        
        var body: some View {
            ZStack {
                FluidGradient(blobs: [.red, .green, .blue],
                              highlights: [.yellow, .orange, .purple],
                              speed: 0.5,
                              blur: 0.7)
                .background(.white)
                if (!active) {
                    Rectangle().fill(Color.accentColor)
                }
            }
        }
    }
    
    var body: some View {
        Button(action: onPress, label: {
            ZStack {
                ButtonBackground(active: !isPause)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 150, height: 150)
                .scaleEffect(isPause ? CGFloat(1.0) : CGFloat(0.9))
                .animation(Animation.spring(response: 0.35, dampingFraction: 0.35, blendDuration: 1), value: isPause)
                Text(isPause ? "Punch In" : "Punch Out")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .scaleEffect(isPause ? CGFloat(1.0) : CGFloat(0.9))
            }
            .shadow(color: .black.opacity(0.1), radius: 12)
        })
        .buttonStyleBlurOnPress()
    }
}

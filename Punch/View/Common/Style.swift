//
//  ButtonStyle.swift
//  Punch
//
//  Created by hong on 2024/2/21.
//

import SwiftUI
import FluidGradient

struct ButtonStyleBlurOnPress: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .blur(radius: configuration.isPressed ? CGFloat(3.5) : 0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 0.35, blendDuration: 1), value: configuration.isPressed)
    }
}

extension Button {
    func buttonStyleBlurOnPress() -> some View {
        self.buttonStyle(ButtonStyleBlurOnPress())
    }
}


//
//  ColorExtension.swift
//  ColorPicker
//
//  Created by Hendrik Ulbrich on 16.07.19.
//

import SwiftUI

extension Color {

    static func fromAngle(angle: Angle) -> Color {
        return Color(hue: angle.radians / (2 * .pi), saturation: 1, brightness: 1)
    }
    
    static func fromAngle(rad: Double) -> Color {
        Color.fromAngle(angle: Angle(radians: rad))
    }

}

extension Gradient {
    
    static let colorWheelSpectrum: Gradient = Gradient(colors: [
        Color.fromAngle(rad: .pi / 2),
        Color.fromAngle(rad: .pi / 4),
        Color.fromAngle(rad: 2 * .pi),
        Color.fromAngle(rad: 7/4 * .pi),
        Color.fromAngle(rad: 3/2 * .pi),
        Color.fromAngle(rad: 5/4 * .pi),
        Color.fromAngle(rad: .pi),
        Color.fromAngle(rad: 3/4 * .pi),
        Color.fromAngle(rad: .pi / 2),
    ])
    
}

//
//  ColorPicker.swift
//  ColorPicker
//
//  Created by Hendrik Ulbrich on 15.07.19.
// 
//  This code uses:
//    https://developer.apple.com/documentation/swiftui/gestures/composing_swiftui_gestures
//  and
//    https://developer.apple.com/wwdc19/237

import SwiftUI

public struct ColorPicker : View {
    
    @Binding public var color: Color
    public var strokeWidth: Length = 30
    
    public var body: some View {
        GeometryReader { geometry -> ColorWheel in
            return ColorWheel(frame: geometry.frame(in: CoordinateSpace.local), color: self.$color, strokeWidth: self.strokeWidth)
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    public init(color: Binding<Color>, strokeWidth: Length) {
        self.$color = color
        self.strokeWidth = strokeWidth
    }
    
}

public struct ColorWheel: View {
    
    public var frame: CGRect
    @Binding public var color: Color
    @State private var position: CGPoint = CGPoint.zero
    @State private var angle: Angle = .degrees(-45)
    public var strokeWidth: Length
    
    public var body: some View {
        let conic = AngularGradient(gradient: Gradient.colorWheelSpectrum, center: .center, angle: .degrees(-90))
        let indicatorOffset = CGSize(width: cos(angle.radians) * Double(frame.midX - strokeWidth / 2), height: -sin(angle.radians) * Double(frame.midY - strokeWidth / 2))
        return ZStack(alignment: .center) {
            Circle()
                .strokeBorder(conic, lineWidth: strokeWidth)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged(self.update(value:))
            )
            Circle()
                .fill(color)
                .frame(width: strokeWidth, height: strokeWidth, alignment: .center)
                .fixedSize()
                .offset(indicatorOffset)
                .allowsHitTesting(false)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                        .offset(indicatorOffset)
                        .allowsHitTesting(false)
            )
        }
    }
    
    public init(frame: CGRect, color: Binding<Color>, strokeWidth: Length) {
        self.frame = frame
        self.$color = color
        self.strokeWidth = strokeWidth
    }
    
    internal func update(value: DragGesture.Value) {
        self.position = value.location
        self.angle = Angle(radians: radCenterPoint(value.location, frame: self.frame))
        self.color = Color.fromAngle(angle: self.angle)
    }
    
    internal func radCenterPoint(_ point: CGPoint, frame: CGRect) -> Double {
        let adjustedAngle = atan2f(Float(frame.midX - point.x), Float(frame.midY - point.y)) + .pi / 2
        return Double(adjustedAngle < 0 ? adjustedAngle + .pi * 2 : adjustedAngle)
    }

}

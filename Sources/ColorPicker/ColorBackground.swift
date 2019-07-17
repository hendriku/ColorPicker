//
//  ColorBackground.swift
//  ColorPicker
//
//  Created by Hendrik Ulbrich on 08.07.19.
//

import SwiftUI

public struct ColorBackground: View {
    
    public var color: Color
    
    public var body: some View {
        Rectangle().fill(color)
    }
    
    public init(color: Color) {
        self.color = color
    }
    
}

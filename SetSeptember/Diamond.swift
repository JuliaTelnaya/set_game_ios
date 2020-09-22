//
//  Diamond.swift
//  SetSeptember
//
//  Created by Юлия Тельная on 21.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let corner1 = CGPoint(x: rect.width, y: rect.midY)
        let corner2 = CGPoint(x: rect.midX, y: 0)
        let corner3 = CGPoint(x: 0, y: rect.midY)
        let corner4 = CGPoint(x: rect.midX, y: rect.height)
        
        var p = Path()
        p.move(to: corner1)
        p.addLine(to: corner2)
        p.addLine(to: corner3)
        p.addLine(to: corner4)
        p.addLine(to: corner1)
        
        return p
    }
    
}

extension Shape {
    /// fills and strokes a shape
    public func fill<S:ShapeStyle>(
        _ fillContent: S,
        stroke       : StrokeStyle
    ) -> some View {
        ZStack {
            self.fill(fillContent)
            self.stroke(style:stroke)
        }
    }
}


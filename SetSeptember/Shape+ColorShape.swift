//
//  Shape+ColorShape.swift
//  SetSeptember
//
//  Created by Юлия Тельная on 23.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import SwiftUI

extension Shape {
    /// fills and strokes a shape
    func colorShape(
        color: Color,
        shade: SetGameVM.shade,
        edgeLineWidth: CGFloat = 3
    ) -> some View {
        ZStack {
            self.fill(color.opacity(shade.opacityValue))
            self.stroke(style:StrokeStyle(lineWidth: edgeLineWidth))
        }
    }
}

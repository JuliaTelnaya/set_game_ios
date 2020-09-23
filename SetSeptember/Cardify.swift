//
//  Cardify.swift
//  memorius
//
//  Created by Юлия Тельная on 22.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import SwiftUI

// TODO: logic match 
struct Cardify: ViewModifier {
    var isMatched: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if !isMatched {
               RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
               content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:  edgeLineWidthMatched)
                content
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let edgeLineWidthMatched: CGFloat = 10
   
}

extension View {
    func cardify(isMatched: Bool) -> some View {
        self.modifier(Cardify(isMatched: isMatched))
    }
}

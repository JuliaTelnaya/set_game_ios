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
    var isChosen: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if !isChosen {
               RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
               content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.black.opacity(0.7))
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:  edgeLineWidth)
                content                
            }
        }
        .aspectRatio(2/3,contentMode: .fit)
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let edgeLineWidthMatched: CGFloat = 3
    
}

extension View {
    func cardify(isChosen: Bool) -> some View {
        self.modifier(Cardify(isChosen: isChosen))
    }
}

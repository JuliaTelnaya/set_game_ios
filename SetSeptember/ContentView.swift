//
//  ContentView.swift
//  SetSeptember
//
//  Created by Юлия Тельная on 18.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: SetGameVM
    
    
    var body: some View {
        VStack {
            Grid(Array(viewModel.cards[0...80])) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
            Text("Hello, World!")
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    
    var body: some View {
        ZStack{
            // TODO: -logic of matching
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            VStack {
                ForEach(Array(0...card.count-1), id: \.self) { _ in
                    Group {
                        if self.card.shape == .circle {
                            Circle().fill(self.card.color.opacity(self.card.shade.opacityValue),stroke: StrokeStyle(lineWidth: self.edgeLineWidth))
                        } else if self.card.shape  == .rectangle {
                            Rectangle().fill(self.card.color.opacity(self.card.shade.opacityValue),stroke: StrokeStyle(lineWidth: self.edgeLineWidth))
                        } else if self.card.shape == .diamond {
                            Diamond().fill(self.card.color.opacity(self.card.shade.opacityValue),stroke: StrokeStyle(lineWidth: self.edgeLineWidth))
                        }
                    }
                    .padding(10)
                }
            }}
        
        .foregroundColor(card.color)
    }
    
    // MARK: - Drawing constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameVM())
    }
}

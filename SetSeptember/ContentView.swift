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
            VStack {
                ForEach(Array(0...card.count-1), id: \.self) { _ in
                    ZStack {
                        if self.card.shape == .circle {
                            Circle().colorShape(color: card.color, shade: card.shade)
                        } else if self.card.shape  == .rectangle {
                            Rectangle().colorShape(color: card.color, shade: card.shade)
                        } else if self.card.shape == .diamond {
                            Diamond().colorShape(color: card.color, shade: card.shade)
                        }
                    }
                    .padding(10)
                }
            }
            .cardify(isMatched: card.isMatched)
        .foregroundColor(card.color)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameVM())
    }
}

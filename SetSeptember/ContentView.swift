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
            //if deal match discard
            Grid(viewModel.cardsInGame) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.easeIn(duration: 2)) {
                        self.viewModel.choose(card: card)
                    }
                }
            }.transition(AnyTransition.scale)
            Button(action: {
                withAnimation(.linear(duration: 1)) {
                    self.viewModel.resetGame()
                }
            }, label: {
                Text("NEW GAME")})
        }
    }
}

// TODO: view modifiers https://developer.apple.com/documentation/swiftui/rotatedshape-view-modifiers

struct CardView: View {
    var card: SetGame.Card
    
    @ViewBuilder
    var body: some View {
            VStack {
                ForEach(Array(0...card.count-1), id: \.self) { _ in
                    ZStack {
                        if self.card.shape == .circle {
                            Circle().colorShape(color: card.color, shade: card.shade)
                                .colorInvert()

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

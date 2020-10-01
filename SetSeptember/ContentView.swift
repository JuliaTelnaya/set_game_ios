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
            Grid(viewModel.cards.filter{$0.isDeal && !$0.isDiscard}) { card in
                CardView(card: card).onTapGesture {
                    // choose card
                    withAnimation(.linear(duration: 2)) {
                        self.viewModel.choose(card: card)
                    }
                }
            }
            .padding(5)
            //.transition(AnyTransition.scale)
            
            HStack {
                
                Button(action: {
                    withAnimation(.linear(duration: 1)) {
                        self.viewModel.new3cards()
                    }
                }, label: {
                    Text("+3 cards")})
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)) {
                        self.viewModel.resetGame()
                    }
                }, label: {
                    Text("NEW GAME")})
            }
        }
        //.transition(AnyTransition.scale)
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
                        } else if self.card.shape  == .rectangle {
                            Rectangle().colorShape(color: card.color, shade: card.shade)
                        } else if self.card.shape == .diamond {
                            Diamond().colorShape(color: card.color, shade: card.shade)
                        }
                    }
                    .aspectRatio(2/3,contentMode: .fit)
                    
                    //animation of shapes
                    //.rotation3DEffect(Angle.degrees(card.isChosen ? 0: 180), axis: (x: 1, y: 0, z: 0))
                }
            }.padding()
            
            //cards are drawn
            .cardify(isChosen: card.isChosen)
            
            .foregroundColor(card.color)
            //between cards padding
            .padding(5)
            .transition(AnyTransition.offset().animation(.easeInOut(duration: 1.0)))
                        
            //.onAppear(        )

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameVM())
    }
}

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
            Grid(Array(viewModel.cards[0...3])) { card in
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
                Diamond()
                Text("\(card.count)")
                Text(card.shade)
                Text(card.shape)
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

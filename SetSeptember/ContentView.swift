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
            ForEach(viewModel.cards) { card in
            CardView(card: card)
            }
            Text("Hello, World!")
        }
    }
}

struct CardView: View {
    var card: SetGame.Card
    var body: some View {
        VStack {
            Text("\(card.count)")
            Text(card.shade)
            Text(card.shape)
        }
        .foregroundColor(card.color)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameVM())
    }
}

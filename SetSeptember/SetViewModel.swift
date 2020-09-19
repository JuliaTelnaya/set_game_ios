//
//  SetViewModel.swift
//  SetSeptember
//
//  Created by Юлия Тельная on 18.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import SwiftUI

class SetGameVM: ObservableObject {
    
    @Published private var model: SetGame = SetGameVM.createSetGame()
    
    var cards: Array<SetGame.Card> {
        model.cards
    }
    
    static func createSetGame() -> SetGame {
        
        let colors = [Color.orange,Color.red, Color.purple]
        
        let shapes = ["circle","rectangle","diamond"]
        
        let shades = ["bold","transparent","semi-transparent"]
        
        let game = SetGame(colors: colors, shapes: shapes, shades: shades)
        
        return game
    }
}

/*
enum Shades: CaseIterable {
    case bold, transparent,
}
 */

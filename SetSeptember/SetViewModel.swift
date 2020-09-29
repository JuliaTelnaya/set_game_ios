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
    
    
    var cardsInGame: Array<SetGame.Card> {
        model.cardsInGame
    }
    
    func choose(card: SetGame.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = SetGameVM.createSetGame()
    }
    
    static func createSetGame() -> SetGame {
        
        let colors = [Color.orange,Color.red, Color.purple]
        
        let shapes = shape.allCases
        
        let shades = shade.allCases
        let game = SetGame(colors: colors, shapes: shapes, shades: shades)
        
        return game
    }
    
    enum shade: CaseIterable{
        case bold, transparent, semiTransparent
        
        var opacityValue: Double  {
            switch self {
            case .bold: return 1
            case .semiTransparent: return 0.3
            case .transparent: return 0
            }
        }
    }
    
    enum shape: CaseIterable{
        case circle, rectangle, diamond
        }
   // https://www.hackingwithswift.com/books/ios-swiftui/switching-view-states-with-enums
    
    
    
}




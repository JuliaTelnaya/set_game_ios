//
//  SetModel.swift
//  SetSeptember
//
//  Created by Юлия Тельная on 18.09.2020.
//  Copyright © 2020 Юлия Тельная. All rights reserved.
//

import Foundation
import SwiftUI

struct SetGame {
    
    var cards: Array<Card>
    var score: Int?
    
    var indexOfChosenCard: Int? {
        get{cards.indices.filter {cards[$0].isChosen}.only}
        set{
            for index in cards.indices{
                cards[index].isChosen = index == newValue}
        }
    }
    
    let card1 = Card(id: 82, color: Color.orange, shape: .circle, count: 2, shade: .bold)
    
    let card2 = Card(id: 83, color: Color.orange, shape: .diamond, count: 2, shade: .bold)
    
    let card3 = Card(id: 84, color: Color.orange, shape: .rectangle, count: 2, shade: .bold)
    
    func checkSet (card1: Card, card2: Card, card3: Card) -> Bool {
        let cards = [card1, card2, card3]
        var colorSet = Set<Color>()
        var shadeSet =  Set<SetGameVM.shade>()
        var shapeSet = Set<SetGameVM.shape>()
        var countSet = Set<Int>()
        
        for card in cards {
            colorSet.insert(card.color)
            shadeSet.insert(card.shade)
            shapeSet.insert(card.shape)
            countSet.insert(card.count)
        }
        
        // if colors(shapes..) are similar, the length of set is one. If all colors are different, the length of set is 3.
        let colorCheck: Bool = colorSet.count == 2 ? false : true
        let shadeCheck: Bool = shadeSet.count == 2 ? false : true
        let shapeCheck: Bool = shapeSet.count == 2 ? false : true
        let countCheck: Bool = countSet.count == 2 ? false : true

        return colorCheck && shadeCheck && shapeCheck && countCheck
    }
    
    // MARK: Work with intent
    mutating func choose(card: Card) {
        print ("card choosen: \(card)")
        print(checkSet(card1: card1, card2: card2, card3: card3))
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isChosen{
            if let potentialMatchIndex = indexOfChosenCard {
                cards[chosenIndex].isMatched = true
                
            } else {
                indexOfChosenCard = chosenIndex
            }
            
        }
    }
    

    
    init (colors: Array<Color>, shapes: Array<SetGameVM.shape>, shades: Array<SetGameVM.shade>) {
         ///allcases
        cards = Array<Card>()
        var id = 0
        for color in colors {
            for shape in shapes {
                for shade in shades  {
                    for count in 1...3 {
                        cards.append(Card(id: id, color: color, shape: shape, count: count, shade: shade))
                        id+=1
                    }
                }
            }
        }
        cards.shuffle()
        
        // MARK: make isDeal
        for card in cards[0...11] {
            cards[card.id].isDeal = true}
    }
    
    
    // TODO: -temporary -delete
    var cardsInGame: Array<SetGame.Card> {
        get {var arrayIsDeal: Array<SetGame.Card> = []
            for card in cards {
                if card.isDeal == true && card.isDiscard == false{
                    arrayIsDeal.append(card)
                }
            }
            return arrayIsDeal
        }
    }
    
    // MARK: Calculate score
    func calculateScore (score: Int?) -> Int {
        var score = score ?? 0
        return score
    }

    
    
    struct Card: Identifiable {
        var id: Int
        var color: Color
        var shape: SetGameVM.shape
        var count: Int
        var shade: SetGameVM.shade
        var isChosen = false
        var isMatched = false
        var isDeal = false
        var isDiscard = false
    }
    
    


}


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
    
    var indexOfChosenCard: Int?{
        get{cards.indices.filter {cards[$0].isChosen}.only}
        set{
            for index in cards.indices{
                cards[index].isChosen = index == newValue}
        }
    }

    
    func checkSet (indices: Set<Int>) -> Bool {
        var cards =  Array<Card>()
        for index in indices {
            cards.append(self.cards[index])
        }

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
        
        print("color check \(colorCheck)")
        print("shade check \(shadeCheck)")
        print("shape check \(shapeCheck)")
        print("count check \(countCheck)")
        
        
        return colorCheck && shadeCheck && shapeCheck && countCheck
    }
    
    var chosenCardsIndices = Set<Int>()
    // MARK: Work with intent
    mutating func choose(card: Card) {
        print ("card choosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card) {
            
            if cards[chosenIndex].isChosen {
                //deselection
                cards[chosenIndex].isChosen = false
            } else {
                
                if chosenCardsIndices.count == 3 {
                    print(checkSet(indices: chosenCardsIndices))
                    if checkSet(indices: chosenCardsIndices) {
                        for index in chosenCardsIndices {
                            cards[index].isDiscard = true
                            cards[index].isMatched = true
                        }
                        
                    } else {
                        for index in chosenCardsIndices {
                            cards[index].isChosen = false
                        }
                    }
                    chosenCardsIndices = Set<Int>()
                }
                cards[chosenIndex].isChosen = true
                chosenCardsIndices.insert(chosenIndex)
                
            }
            
        
            
        }

    }
    
    mutating func new3cards() {
        let cardsInDeck = cards.filter{!$0.isDeal && !$0.isDiscard}
        for card in cardsInDeck[0...2] {
            if let chosenIndex = cards.firstIndex(matching: card) {
                cards[chosenIndex].isDeal = true
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
    
    
    
    // MARK: Calculate score
    func calculateScore (score: Int?) -> Int {
        var score = score ?? 0
        return score
    }

    
    
    struct Card: Identifiable, Hashable {
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


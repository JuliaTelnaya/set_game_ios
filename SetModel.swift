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
    
    
    
    // MARK: Work with intent
    mutating func choose(card: Card) {
        print ("card choosen: \(card)")
    }
    
    // MARK: Calculate score
    func calculateScore (score: Int?) -> Int {
        var score = score ?? 0
        return score
    }
    
    init (colors: Array<Color>, shapes: Array<String>, shades: Array<String>) {
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
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var color: Color
        var shape: String
        var count: Int
        var shade: String
        var isMatched = false
        var isDeck = true
        var isDisappeared = false //удалить просто
    }
    


}


//
//  Concentration.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 14/6/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation
class Concentration {
    var cards = Array<Card>()

    var indexOfOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }

    }
    func chooseCard(at index: Int) {
        if !cards[index].isMached {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMached = true
                    cards[matchIndex].isMached = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //TODO: Shuffle cards
}
//
//  Concentration.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 14/6/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation
class Concentration {
    private(set) var cards = Array<Card>()

    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
        }
        set  {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

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
                if cards[index] == cards[matchIndex] {
                    cards[index].isMached = true
                    cards[matchIndex].isMached = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //TODO: Shuffle cards
}

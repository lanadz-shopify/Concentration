//
//  ViewController.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 10/6/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount: Int = 0 {
    didSet {
        flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardsButtons.count + 1) / 2)
    @IBOutlet var cardsButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardIndex = cardsButtons.index(of: sender)!
        //flipCard(withEmoji: symbols[cardIndex], on: sender)
        game.chooseCard(at: cardIndex)
        updatelViewFromModel()
    }

    func updatelViewFromModel() {
        for index in cardsButtons.indices {
            let button = cardsButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMached ? #colorLiteral(red: 1, green: 0.6439058386, blue: 0.3423922962, alpha: 0) : #colorLiteral(red: 1, green: 0.6439058386, blue: 0.3423922962, alpha: 1)
            }
        }
    }

    var symbols: Array<String> = ["🦊","🦋","🐤","🐸","🌴","😄", "🐶", "🐝", "🐌", "🦀", "🌷", "🌺", "🌼", "🌞", "🍎", "🍏", "🍓", "🥑", "🥦", "🥐"]
    var emoji = Dictionary<Int,String>()

    func emoji(for card: Card) -> String {
        print("card: \(card.identifier)")
        if emoji[card.identifier] == nil, symbols.count > 0 {
            let randomIndexForSymbols = Int(arc4random_uniform(UInt32(symbols.count)))
            emoji[card.identifier] = symbols.remove(at: randomIndexForSymbols)
        }
        return emoji[card.identifier] ?? "?"
    }
}

  //
  //  ViewController.swift
  //  Concentration
  //
  //  Created by Svitlana Dzyuban on 10/6/18.
  //  Copyright © 2018 Lana Dzyuban. All rights reserved.
  //
  
  import UIKit

  class ConcentrationViewController: UIViewController {
    private var numberOfPairsOfCards: Int {
        return (cardsButtons.count + 1) / 2
    }

    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    @IBOutlet private var cardsButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction func startNewGame(_ sender: Any) {
        if ((sender as? UIButton) != nil) {
            game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
            updatelViewFromModel()
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {

        let cardIndex = cardsButtons.index(of: sender)!
        //flipCard(withEmoji: symbols[cardIndex], on: sender)
        game.chooseCard(at: cardIndex)
        updatelViewFromModel()
    }
    
    private func updatelViewFromModel() {
        if cardsButtons != nil {
            for index in cardsButtons.indices {
                let button = cardsButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                } else {
                    button.setTitle("", for: UIControlState.normal)
                    button.backgroundColor = card.isMached ? #colorLiteral(red: 1, green: 0.6439058386, blue: 0.3423922962, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
    }
    
    var theme: String? {
        didSet {
            symbols = theme ?? ""
            emoji = [:]
            updatelViewFromModel()
        }
    }
    private var symbols: String = "🦊🦋🐤🐸🌴😄🐶🐝🐌🦀🌷🌺🌼🌞🍎🍏🍓🥑🥦🥐"
    private var emoji = Dictionary<Card,String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, symbols.count > 0 {
            let randomIndexForSymbols = symbols.index(symbols.startIndex, offsetBy: symbols.count.random)
            emoji[card] = String(symbols.remove(at: randomIndexForSymbols))
        }
        return emoji[card] ?? "?"
    }
  }

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
        return (visibleCardsButtons.count + 1) / 2
    }

    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    @IBOutlet private var cardsButtons: [UIButton]!
    private var visibleCardsButtons: [UIButton]! {
        return cardsButtons?.filter { !$0.superview!.isHidden}
    }
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction func startNewGame(_ sender: Any) {
        if ((sender as? UIButton) != nil) {
            game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
            symbols = Themes().getEmojiString(theme: selectedTheme)
            updatelViewFromModel()
        }
    }
    @IBAction private func touchCard(_ sender: UIButton) {

        let cardIndex = visibleCardsButtons.index(of: sender)!
        //flipCard(withEmoji: symbols[cardIndex], on: sender)
        game.chooseCard(at: cardIndex)
        updatelViewFromModel()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatelViewFromModel()
    }
    
    private func updatelViewFromModel() {
        if visibleCardsButtons != nil {
            for index in visibleCardsButtons.indices {
                let button = visibleCardsButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emoji(for: card), for: UIControlState.normal)
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                } else {
                    button.setTitle("", for: UIControlState.normal)
                    button.backgroundColor = card.isMached ? #colorLiteral(red: 1, green: 0.6439058386, blue: 0.3423922962, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
                }
            }
            //            flipCountLabel.text = "Flips: \(game.flipCount)"
            flipCountLabel.text = traitCollection.verticalSizeClass == .compact ? "Flips: \(game.flipCount)" : "Flips - \(game.flipCount)"
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("changed trait")
    }
    var selectedTheme: String? {
        didSet {
            symbols = Themes().getEmojiString(theme: selectedTheme)
            emoji = [:]
            updatelViewFromModel()
        }
    }
    private var symbols: String = ""
    private var emoji = Dictionary<Card,String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, symbols.count > 0 {
            let randomIndexForSymbols = symbols.index(symbols.startIndex, offsetBy: symbols.count.random)
            emoji[card] = String(symbols.remove(at: randomIndexForSymbols))
        }
        return emoji[card] ?? "?"
    }
  }

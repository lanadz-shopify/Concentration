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

    var symbols: Array<String> = ["🦊","🦋","🦊","🐤","🦋","🐸","🌴","🌴","😄","🐸","😄","🐤"]
    @IBOutlet var cards: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardIndex = cards.index(of: sender)!
        flipCard(withEmoji: symbols[cardIndex], on: sender)
    }

    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6439058386, blue: 0.3423922962, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

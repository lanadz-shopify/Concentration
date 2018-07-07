//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 7/7/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Animals": "🐱🐭🦁🐸🐒🐥🦄🐝🐌🦋🐔🦋🐬🐟🐕🐈🐓🦔",
        "Sports": "⚽️🏀🏈⚾️🏉🏐🏓⛸🏊‍♀️🏹🥊⛹️‍♂️🏌️‍♀️🏄‍♀️🧘‍♂️",
        "Faces": "😀😄😇😍😜🤓😎🤩☹️😢😡😱😯😲🤠"
    ]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}

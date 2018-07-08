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
    var spliViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = spliViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }

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

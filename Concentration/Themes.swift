//
//  Themes.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 19/7/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation

struct Themes {
    private let variants = [
        "Animals": "🐱🐭🦁🐸🐒🐥🦄🐝🐌🦋🐔🐬🐟🐕🐈🐓🦔",
        "Sports": "⚽️🏀🏈⚾️🏉🏐🏓⛸🏊‍♀️🏹🥊⛹️‍♂️🏌️‍♀️🏄‍♀️🧘‍♂️",
        "Faces": "😀😄😇😍😜🤓😎🤩☹️😢😡😱😯😲🤠",
        "Default": "❤️💙♠️♣️♦️⏰🎀🎁🦊🐭🦅🦉🐱"
    ]

    func getEmojiString(theme: String?) -> String {
        if theme != nil && variants.keys.contains(theme!) {
            return variants[theme!]!
        } else {
            return variants["Default"]!
        }
    }
}

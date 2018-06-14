//
//  Card.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 14/6/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMached: Bool = false
    var identifier: Int

    static var identifierFactory = 0

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init(identifier: Int) {
        self.identifier = identifier
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

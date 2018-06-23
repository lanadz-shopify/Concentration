//
//  Card.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 14/6/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var hashValue: Int { return self.identifier}

    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }


    var isFaceUp: Bool = false
    var isMached: Bool = false
    private var identifier: Int

    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
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

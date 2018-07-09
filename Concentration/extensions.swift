//
//  extensions.swift
//  Concentration
//
//  Created by Svitlana Dzyuban on 9/7/18.
//  Copyright © 2018 Lana Dzyuban. All rights reserved.
//

import Foundation

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(-self)))
        } else {
            return 0
        }
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

extension Array {
    mutating func shuffle() -> Array {
        var existing = self
        self.removeAll()

        while existing.count > 0 {
           self.append(existing.remove(at: existing.count.random))
        }

        return self
    }
}

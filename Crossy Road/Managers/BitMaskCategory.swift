//
//  BitMaskCategory.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

extension SKPhysicsBody {
    var category: BitMaskCategory {
        get {
            return BitMaskCategory(rawValue: self.categoryBitMask)
        }
        set {
            self.categoryBitMask = newValue.rawValue
        }
    }
}

struct BitMaskCategory: OptionSet {
    let rawValue: UInt32
    
    static let none = BitMaskCategory(rawValue: 0 << 0)
    static let player = BitMaskCategory(rawValue: 1 << 0)
    static let car = BitMaskCategory(rawValue: 1 << 1)
    static let all = BitMaskCategory(rawValue: UInt32.max)
}

//
//  Player.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private let jumpDistance: CGFloat = 60
    
    static func populate(at point: CGPoint) -> Player {
        let playerTexture = SKTexture(imageNamed: "character")
        let player = Player(texture: playerTexture)
        player.position = point
        player.zPosition = 10
        return player
    }
    
    func jump(isForward: Bool) {
        let jumpAction = SKAction.moveBy(x: 0, y: isForward ? jumpDistance : -jumpDistance, duration: 0.3)
        jumpAction.timingMode = .easeInEaseOut
        self.run(jumpAction)
    }
    
}

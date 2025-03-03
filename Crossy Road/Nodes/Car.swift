//
//  Car.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class Car: SKSpriteNode {
    
    enum Direction {
        case left
        case right
    }
    
    private let initialSize = CGSize(width: 120, height: 60)
    
    init(imageName: String, name: String, direction: Direction, duration: TimeInterval = 8.0) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: initialSize)
        self.name = name
        self.zPosition = 2
        
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0, size: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = BitMaskCategory.car.rawValue
        self.physicsBody?.collisionBitMask = BitMaskCategory.none.rawValue
        self.physicsBody?.contactTestBitMask = BitMaskCategory.player.rawValue
        
        startMovement(direction: direction, duration: duration)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startMovement(direction: Direction, duration: TimeInterval) {
        let screenWidth = UIScreen.main.bounds.width + 240
        let targetPositionX: CGFloat = (direction == .left) ? -screenWidth : screenWidth
        let movementAction = SKAction.moveTo(x: targetPositionX, duration: duration)
        run(movementAction)
    }
}


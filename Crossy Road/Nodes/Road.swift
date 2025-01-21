//
//  Road.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class Road: SKSpriteNode {
    
    static func populate(at point: CGPoint) -> Road {
        let road = Road(imageNamed: "road")
        road.position = point
        road.zPosition = 1
        road.size.height = 120
        road.name = "road"
        return road
    }
    
}

//
//  HUD.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class HUD: SKNode {

    let pauseButton = SKLabelNode(text: "Pause")
    
    func configureUI() {
        pauseButton.horizontalAlignmentMode = .right
        pauseButton.verticalAlignmentMode = .center
        pauseButton.zPosition = 100
        pauseButton.fontName = "AmericanTypewriter-Bold"
        pauseButton.fontSize = 30
        pauseButton.fontColor = .white
        pauseButton.name = "pause"
        addChild(pauseButton)
    }
    
}

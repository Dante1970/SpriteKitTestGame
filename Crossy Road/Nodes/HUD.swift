//
//  HUD.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class HUD: SKNode {
    
    let timeLabel = SKLabelNode(text: "0.0s")
    var time: TimeInterval = 0 {
        didSet {
            timeLabel.text = String(format: "%.1fs", time)
        }
    }
    
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
        
        timeLabel.horizontalAlignmentMode = .center
        timeLabel.verticalAlignmentMode = .center
        timeLabel.zPosition = 100
        timeLabel.fontName = "AmericanTypewriter-Bold"
        timeLabel.fontSize = 25
        addChild(timeLabel)
    }
    
}

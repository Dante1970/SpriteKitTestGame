//
//  WinScene.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class WinScene: SKScene {
    
    private let timeLabel = SKLabelNode(text: "1m !")
    
    override func didMove(to view: SKView) {
        
        let header = ButtonNode(titled: "you win!")
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        header.label.fontColor = .green
        addChild(header)
        
        if timeLabel.parent == nil {
            timeLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
            timeLabel.horizontalAlignmentMode = .center
            timeLabel.verticalAlignmentMode = .center
            timeLabel.fontName = "AmericanTypewriter-Bold"
            timeLabel.fontSize = 25
            timeLabel.fontColor = .lightGray
            addChild(timeLabel)
        }
        
        let titles = ["play", "results"]
        
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title)
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "play" {
            let transition = SKTransition.crossFade(withDuration: 0.3)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
        } else if node.name == "results" {
            let transition = SKTransition.crossFade(withDuration: 0.3)
            let gameScene = ResultsScene(size: self.size)
            gameScene.backScene = self
            gameScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}

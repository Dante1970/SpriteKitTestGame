//
//  GameOverScene.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class GameOverScene: SKScene {

    var backScene: SKScene?
    var time: TimeInterval = 0 {
        didSet {
            timeLabel.text = String(format: "%.1fs", time)
        }
    }
    
    private let sceneManager = SceneManager.shared
    private let timeLabel = SKLabelNode(text: "0.0s")
    
    override func didMove(to view: SKView) {
        
        let header = ButtonNode(titled: "game over")
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        header.label.fontColor = .red
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
        
        let titles = ["restart", "results"]
        
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title)
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let gameScene = sceneManager.gameScene {
            if !gameScene.isPaused {
                gameScene.isPaused = true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "restart" {
            sceneManager.gameScene = nil
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
            
        } else if node.name == "results" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let optionsScene = ResultsScene(size: self.size)
            optionsScene.backScene = self
            optionsScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(optionsScene, transition: transition)
            
        }
    }
}

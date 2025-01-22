//
//  GameOverScene.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class GameOverScene: SKScene {
    
    private let sceneManager = SceneManager.shared
    var backScene: SKScene?
    
    override func didMove(to view: SKView) {
        
        let header = ButtonNode(titled: "game over")
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        header.label.fontColor = .red
        addChild(header)
        
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

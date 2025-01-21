//
//  MenuScene.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
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

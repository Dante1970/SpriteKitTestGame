//
//  ResultsScene.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import SpriteKit

class ResultsScene: SKScene {
    
    var backScene: SKScene?
    
    override func didMove(to view: SKView) {
        
        let titles = ["back"]
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title)
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200 + CGFloat(100 * index))
            button.name = title
            button.label.name = title
            addChild(button)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "back" {
            let transition = SKTransition.crossFade(withDuration: 0.3)
            guard let backScene = backScene else { return }
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
    }
    
}

//
//  GameScene.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player: Player!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 63 / 255, green: 111 / 255, blue: 24 / 255, alpha: 1)
        
        let screen = UIScreen.main.bounds
        
        player = Player.populate(at: CGPoint(x: screen.size.width / 2, y: 300))
        addChild(player)
        
        addSwipeGestureRecognizers()
    }
    
    private func addSwipeGestureRecognizers() {
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        gestureRecognizer.direction = .down
        view?.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc private func handleSwipe() {
        player.jump(isForward: false)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.jump(isForward: true)
    }
    
}

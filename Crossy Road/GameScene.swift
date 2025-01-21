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
    private let cameraNode: SKCameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 63 / 255, green: 111 / 255, blue: 24 / 255, alpha: 1)
        
        let screen = UIScreen.main.bounds
        
        player = Player.populate(at: CGPoint(x: screen.size.width / 2, y: 300))
        addChild(player)
        
        addChild(cameraNode)
        camera = cameraNode
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
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
        let visibleBounds = getVisibleBounds()
        let playerOffsetThreshold = visibleBounds.minY + 300
        
        if player.position.y >= playerOffsetThreshold {
            let targetCameraY = cameraNode.position.y + (player.position.y - playerOffsetThreshold)
            let moveAction = SKAction.moveTo(y: targetCameraY, duration: 0.3)
            moveAction.timingMode = .easeInEaseOut
            cameraNode.run(moveAction)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        cameraNode.position.y += 0.5
    }
    
    private func getVisibleBounds() -> CGRect {
        guard let view = self.view else { return .zero }

        let width = view.bounds.width
        let height = view.bounds.height

        let centerX = cameraNode.position.x
        let centerY = cameraNode.position.y

        let minX = centerX - width / 2
        let minY = centerY - height / 2

        return CGRect(x: minX, y: minY, width: width, height: height)
    }
    
}

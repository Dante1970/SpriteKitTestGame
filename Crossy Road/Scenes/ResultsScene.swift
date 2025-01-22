//
//  ResultsScene.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import UIKit
import SpriteKit

class ResultsScene: SKScene {
    
    var resultsTableView = ResultsTableView()
    var backScene: SKScene?
    
    override func didMove(to view: SKView) {
        
        let button = ButtonNode(titled: "back")
        button.position = CGPoint(x: self.frame.midX, y: 0)
        button.name = "back"
        button.label.name = "back"
        addChild(button)
        
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        resultsTableView.frame = CGRect(x: 20, y: 50, width: size.width - 40, height: size.height / 1.5)
        resultsTableView.backgroundColor = .clear
        resultsTableView.isScrollEnabled = false
        self.scene?.view?.addSubview(resultsTableView)
        resultsTableView.reloadData()
        
        updateSafeAreaInsets()
    }
    
    private func updateSafeAreaInsets() {
        guard let safeAreaInsets = view?.safeAreaInsets else { return }
        
        let margin = 16.0
        let bottomOffset = safeAreaInsets.bottom
        let verticalBasePosition: CGFloat = bottomOffset + margin
        
        for node in children {
            if node.name == "back" {
                node.position.y = verticalBasePosition
            }
        }
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        updateSafeAreaInsets()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "back" {
            resultsTableView.removeFromSuperview()
            let transition = SKTransition.crossFade(withDuration: 0.3)
            guard let backScene = backScene else { return }
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
    }
    
}

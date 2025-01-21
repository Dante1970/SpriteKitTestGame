//
//  ButtonNode.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class ButtonNode: SKSpriteNode {
    
    let label: SKLabelNode = {
        let label = SKLabelNode(text: "")
        label.fontColor = .white
        label.fontName = "AmericanTypewriter-Bold"
        label.fontSize = 30
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.zPosition = 2
        return label
    }()
    
    init(titled title: String?) {
        super.init(texture: nil, color: .clear, size: CGSize(width: 250, height: 100))
        if let title = title {
            label.text = title.uppercased()
        }
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  SceneManager.swift
//  Crossy Road
//
//  Created by Developer on 22.01.2025.
//

import Foundation

class SceneManager {
    static var shared = SceneManager()
    private init() {}
    
    var gameScene: GameScene?
}

//
//  LeftCar.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import SpriteKit

class LeftCar: Car {
    init() {
        super.init(imageName: "left_car", name: "left_car", direction: .left)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

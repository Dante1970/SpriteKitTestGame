//
//  RightCar.swift
//  Crossy Road
//
//  Created by Developer on 21.01.2025.
//

import UIKit

class RightCar: Car {
    init() {
        super.init(imageName: "right_car", name: "right_car", direction: .right)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

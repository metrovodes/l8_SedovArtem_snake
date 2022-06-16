//
//  Apple.swift
//  l8_sedov_snake
//
//  Created by Артем Седов on 13.06.2022.
//  Copyright © 2022 self. All rights reserved.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode{
    
    init(position: CGPoint){
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x:0, y:0, width: 10, height: 10)).cgPath
        fillColor = .red
        strokeColor = .red
        lineWidth = 0
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0,
                                         center: CGPoint(x: 5, y: 5))
        
        self.physicsBody?.categoryBitMask = CollisionCategory.Apple
        
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

//
//  SnakeHead.swift
//  l8_sedov_snake
//
//  Created by Артем Седов on 13.06.2022.
//  Copyright © 2022 self. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart{
    
    override init(atPoint point: CGPoint){
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple | CollisionCategory.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

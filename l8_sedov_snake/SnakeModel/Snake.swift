//
//  Snake.swift
//  l8_sedov_snake
//
//  Created by Артем Седов on 13.06.2022.
//  Copyright © 2022 self. All rights reserved.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode{
    
    var body = [SnakeBodyPart]()
    
    let moveSPeed: CGFloat = 125.0
    
    var angle: CGFloat = 0.0
    
    init(atPoint point: CGPoint){
        super.init()
        let head = SnakeHead(atPoint: point)
        body.append(head)
        addChild(head)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBodyPart(){
        
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y:body[0].position.y))
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
}

extension Snake{
    func move(){
        guard !body.isEmpty else{return}
        
        let head = body[0]
        
        moveHead(head)
        
        for index in (0..<body.count) where index > 0{
            let previousBodyPart = body[index - 1]
            let currentBodyPart = body[index]
            
            moveBodyPart(previousBodyPart, c: currentBodyPart)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart){
        
        let dx = moveSPeed * sin(angle)
        let dy = moveSPeed * cos(angle)
        
        let nextPosition = CGPoint(x: head.position.x + dx,
                                   y: head.position.y + dy)
        
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        
        head.run(moveAction)
        
    }
    
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart){
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x,
                                                   y: p.position.y),
                                       duration: 0.1)
        c.run(moveAction)
    }
}

// Поворот змеи
extension Snake{
    func moveClockWise(){
        angle += CGFloat(Double.pi/2)
    }
    func moveCounterClockwise(){
        angle -= CGFloat(Double.pi/2)
    }
}

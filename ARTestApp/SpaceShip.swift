//
//  SpaceShip.swift
//  ARTestApp
//
//  Created by Yusuf Miletli on 7/11/17.
//  Copyright © 2017 Miletli. All rights reserved.
//

import ARKit

class SpaceShip: SCNNode {
    
    func loadModal() {
        
        guard let virtualSceneObject = SCNScene(named: "art.scnassets/ship.scn") else { return }
        
        let wrapperNode = SCNNode()
        
        for child in virtualSceneObject.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode) //With that we can load our ship
        
        self.attack()
    }
    
    func attack() {
        let me = SCNVector3(0,0,0)
        let distance = sqrt(pow(self.position.x, 2) + pow(self.position.y, 2) + pow(self.position.z, 2))
        let angle = 45
        let randomDuration = Double(Utility().randomGenerator(lowerBound: 3, upperBound: 10))
        let action:SCNAction = SCNAction.move(to: me, duration: randomDuration)
        let rotate:SCNAction = SCNAction.rotate(by: CGFloat.init(angle), around: me, duration: randomDuration)
        self.runAction(action)
        self.runAction(rotate)
    }
}

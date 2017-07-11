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
        guard let virtualSceneObject = SCNScene(named: "ship.scnassets/ship.scn") else {return}
        
        let wrapperNode = SCNNode()
        
        for child in virtualSceneObject.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode) //With that we can load our ship
    }
    
}

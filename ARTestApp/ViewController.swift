//
//  ViewController.swift
//  ARTestApp
//
//  Created by Yusuf Miletli on 7/11/17.
//  Copyright © 2017 Miletli. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView:ARSCNView!
    @IBOutlet weak var countLabel:UILabel!
    
    var level:Int = 1
    var counter:Int = 0 {
        didSet {
            self.countLabel.text = "\(counter)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countLabel.text = "Level = \(level)"
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let conf = ARWorldTrackingSessionConfiguration()
        sceneView.session.run(conf)
        self.reloadLevel()
    }
    
    func reloadLevel() {
        sceneView.scene.rootNode.removeFromParentNode()
        
        for index in 0...level*3 {
            self.addObject()
            print("Added \(index) object")
        }
    }
    
    func addObject() {
        
        let ship = SpaceShip()
        ship.loadModal()
        
        let xPos = randomPosition(lowerBound: -20.5, upperBound: 20.5)
        let yPos = randomPosition(lowerBound: 0.5, upperBound: 20)
        let zPos = randomPosition(lowerBound: -100.5, upperBound: -50)
        
        ship.position = SCNVector3(xPos,yPos,zPos) //1 meter away from camera
        sceneView.scene.rootNode.addChildNode(ship)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            let hitList = sceneView.hitTest(location, options: nil)
            if let hitObject = hitList.first {
                let node = hitObject.node
                if node.name == "ARShip" {
                    counter += 1
                    node.removeFromParentNode()
                    if counter == level * 3 {
                        level += 1
                        counter = 0
                        self.countLabel.text = "Level = \(level)"
                        self.reloadLevel()
                    }
                    else {
                        
                    }
                }
            }
        }
    }
    
    func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower-upper) + upper
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


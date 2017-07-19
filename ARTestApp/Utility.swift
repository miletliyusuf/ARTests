//
//  Utility.swift
//  ARTestApp
//
//  Created by Yusuf Miletli on 7/19/17.
//  Copyright © 2017 Miletli. All rights reserved.
//

import Foundation

class Utility {
    public func randomGenerator (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower-upper) + upper
    }
}

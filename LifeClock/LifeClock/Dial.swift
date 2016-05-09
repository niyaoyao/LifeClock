//
//  Dial.swift
//  LifeClock
//
//  Created by NiYao on 5/9/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class Dial: Clock {

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokeEllipseInRect(context, self.bounds)
    }

}

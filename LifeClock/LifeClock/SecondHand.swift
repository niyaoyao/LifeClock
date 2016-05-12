//
//  SecondHand.swift
//  LifeClock
//
//  Created by NiYao on 5/9/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class SecondHand: Clock {

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 1)
        let startX = self.bounds.size.width/2.0
        let startY = self.bounds.size.height/2.0
        let endX = startX
        let endY = CGFloat(25.0)
        CGContextMoveToPoint(context, startX, startY)
        CGContextAddLineToPoint(context, endX, endY)
        CGContextStrokePath(context)
    }
}

//
//  HourHand.swift
//  LifeClock
//
//  Created by NiYao on 5/9/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class HourHand: Clock {

    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 8)
        let startX = self.bounds.size.width/2.0
        let startY = self.bounds.size.height/2.0
        let endX = startX
        let endY = CGFloat(3.0)
        CGContextMoveToPoint(context, startX, startY)
        CGContextAddLineToPoint(context, endX, endY)
        CGContextStrokePath(context)
    }

}

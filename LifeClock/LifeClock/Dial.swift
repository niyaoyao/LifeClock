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
        let dialLineWidth = CGFloat(5.0)
        let context = UIGraphicsGetCurrentContext()
        setupDial(self.bounds, lineWidth: dialLineWidth, context: context!)
        setupDailNumberLine(context!, dialLineWidth: dialLineWidth)
    }
    
    func setupDial(rect: CGRect, lineWidth: CGFloat, context: CGContextRef) {
        let padding = lineWidth/2.0;
        let x = padding;
        let y = padding;
        let radius = self.bounds.width/2.0
        
        var dialRect = rect
        dialRect.origin.x = x
        dialRect.origin.y = y
        dialRect.size.width = rect.size.width - 2 * padding
        dialRect.size.height = rect.size.height - 2 * padding
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokeEllipseInRect(context, dialRect)
        
        let centerPoint = radius - lineWidth / 2.0
        let centerRect = CGRectMake(centerPoint, centerPoint, lineWidth, lineWidth)
        CGContextStrokeEllipseInRect(context, centerRect)
    }
    
    func strokeDialNumberLine(context: CGContextRef, dialLineWidth: CGFloat, start: CGPoint, end: CGPoint) {
        let lineWidth = CGFloat(3.0)
        CGContextSetLineWidth(context, lineWidth)
        CGContextMoveToPoint(context, start.x, start.y)
        CGContextAddLineToPoint(context, end.x, end.y)
        CGContextStrokePath(context)
    }
    
    func setupDailNumberLine(context: CGContextRef, dialLineWidth: CGFloat) {
        let radius = self.bounds.size.width/2.0
        let length = CGFloat(10)
        let padding = dialLineWidth * 2
        
        let start12 = CGPointMake(radius, padding)
        let end12 = CGPointMake(start12.x, start12.y + length)
        strokeDialNumberLine(context, dialLineWidth: dialLineWidth, start: start12, end: end12)
        
        let start3 = CGPointMake(2*radius - 2*padding, radius)
        let end3 = CGPointMake(start3.x + length, start3.y)
        strokeDialNumberLine(context, dialLineWidth: dialLineWidth, start: start3, end: end3)
        
        let start6 = CGPointMake(start12.x, 2*radius - 2*padding)
        let end6 = CGPointMake(start6.x, start6.y + length)
        strokeDialNumberLine(context, dialLineWidth: dialLineWidth, start: start6, end: end6)
        
        let start9 = CGPointMake(padding, start3.y)
        let end9 = CGPointMake(start9.x + length, start9.y)
        strokeDialNumberLine(context, dialLineWidth: dialLineWidth, start: start9, end: end9)
    }
}

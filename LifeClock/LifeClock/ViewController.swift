//
//  ViewController.swift
//  LifeClock
//
//  Created by NiYao on 5/9/16.
//  Copyright © 2016 SuneBearNi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var hourHand:HourHand! = nil
    var secondHand:SecondHand! = nil
    var minuteHand:MinuteHand! = nil
    let kClockWidth = CGFloat(300.0)
    let kClockY = CGFloat(80)
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRectMake((view.bounds.size.width - kClockWidth)/2.0, kClockY,
                              kClockWidth, kClockWidth)
        let dial = Dial(frame: rect)

        hourHand = HourHand(frame: rect)
        secondHand = SecondHand(frame: rect)
        minuteHand = MinuteHand(frame: rect)

        view.addSubview(hourHand)
        view.addSubview(minuteHand)
        view.addSubview(secondHand)
        view.addSubview(dial)
        tick()
    
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0), target: self, selector:#selector(ViewController.tick), userInfo: nil, repeats: true)
        timer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tick() {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let hour = calendar!.component(NSCalendarUnit.Hour, fromDate: NSDate())
        let minute = calendar!.component(NSCalendarUnit.Minute, fromDate: NSDate())
        let second = calendar!.component(NSCalendarUnit.Second, fromDate: NSDate())
        
        let hourAngle = CGFloat(Double(hour) / 12.0 * M_PI * 2.0) + CGFloat(Double(minute) / 60.0 * ( M_PI / 6.0 ))
        let minuteAngle = CGFloat((Double(minute) / 60.0) * M_PI * 2.0)
        let secondAngle = CGFloat((Double(second) / 60.0) * M_PI * 2.0)
        
        hourHand.transform = CGAffineTransformMakeRotation(hourAngle)
        minuteHand.transform = CGAffineTransformMakeRotation(minuteAngle)
        secondHand.transform = CGAffineTransformMakeRotation(secondAngle)
    }
    
}


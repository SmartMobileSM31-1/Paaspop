//
//  TimeSlot.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class TimeSlot {
    
    var stage: Int
    var act: Act
    var start: NSDate
    var end: NSDate
    
    init(stage: Int, act: Act, start: NSDate, end: NSDate) {
        self.stage = stage
        self.act = act
        self.start = start
        self.end = end
    }
    
    init(fromNSDictionary dictionary: NSDictionary) {
        self.act = Act(fromNSDictionary: dictionary)
        let times: NSArray = dictionary["times"] as NSArray
        let time: NSDictionary = times[0] as NSDictionary
        self.stage = time["stage"] as Int
        self.start = NSDate()
        self.end = NSDate()
    }
}
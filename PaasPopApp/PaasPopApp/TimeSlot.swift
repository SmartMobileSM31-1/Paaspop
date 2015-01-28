//
//  TimeSlot.swift
//  PaasPopApp
//
//  Created by Fhict on 28/12/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

import UIKit

class TimeSlot: NSObject, NSCoding {
    
    var stage: Int?
    var act: Act?
    var start: NSDate?
    var end: NSDate?
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.stage = decoder.decodeIntegerForKey("stage")
        self.act = decoder.decodeObjectForKey("act") as Act?
        self.start = decoder.decodeObjectForKey("start") as NSDate?
        self.end = decoder.decodeObjectForKey("end") as NSDate?
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        var dummyStage: Int32 = 0
        coder.encodeInt(dummyStage, forKey: "stage")
        coder.encodeObject(self.act, forKey: "act")
        coder.encodeObject(self.start, forKey: "start")
        coder.encodeObject(self.end, forKey: "end")
    }
    
    override init() {
        
    }
    
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
        self.stage = 0
        self.start = NSDate()
        self.end = NSDate()
    }
}
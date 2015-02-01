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
    var day: Int?
    var start: NSDate?
    var end: NSDate?
    var color: UIColor?
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.stage = decoder.decodeIntegerForKey("stage")
        self.act = decoder.decodeObjectForKey("act") as Act?
        self.day = decoder.decodeObjectForKey("day") as Int?
        self.start = decoder.decodeObjectForKey("start") as NSDate?
        self.end = decoder.decodeObjectForKey("end") as NSDate?
        self.color = decoder.decodeObjectForKey("color") as UIColor?
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        var dummyStage: Int32 = 0
        coder.encodeInt(dummyStage, forKey: "stage")
        coder.encodeObject(self.act, forKey: "act")
        coder.encodeObject(self.day, forKey: "day")
        coder.encodeObject(self.start, forKey: "start")
        coder.encodeObject(self.end, forKey: "end")
        coder.encodeObject(self.color, forKey: "color")
    }
    
    override init() {
        
    }
    
    init(stage: Int, act: Act, day: Int ,start: NSDate, end: NSDate) {
        self.stage = stage
        self.act = act
        self.day = day
        self.start = start
        self.end = end
    }
    
    
    init(fromNSDictionary dictionary: NSDictionary) {
        super.init()
        self.act = Act(fromNSDictionary: dictionary)
        let times: NSArray = dictionary["times"] as NSArray
        let time: NSDictionary = times[0] as NSDictionary
        self.stage = 0
//        self.day = time["day"] as Int?
        self.day = 0
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var startString = time["start"] as String
        var endString = time["end"] as String
        
        self.start = dateFormatter.dateFromString(startString)
        self.end = dateFormatter.dateFromString(endString)
        
        if (self.start != nil) && (self.end != nil) {
            self.color = Color.getRandomColor()
        } else {
            self.color = UIColor.blackColor()
        }
    }
    
    func getStartCGFloat() -> CGFloat {
        if start != nil {
            return TimeUtils.timeToCGFloat(self.start!)
        } else {
            return CGFloat(0)
        }
    }
    
    func getEndCGFloat() -> CGFloat {
        if end != nil {
            return TimeUtils.timeToCGFloat(self.end!)
        } else {
            return CGFloat(0)
        }
    }
}
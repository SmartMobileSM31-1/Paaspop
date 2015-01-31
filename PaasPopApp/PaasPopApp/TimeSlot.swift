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
    
//    init(stage: Int, act: Act, day: Int ,start: NSDate, end: NSDate) {
//        self.stage = stage
//        self.act = act
//        self.day = day
//        self.start = start
//        self.end = end
//    }
    
    
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
            return TimeSlot.timeToCGFloat(self.start!)
        } else {
            return CGFloat(0)
        }
    }
    
    func getEndCGFloat() -> CGFloat {
        if end != nil {
            return TimeSlot.timeToCGFloat(self.end!)
        } else {
            return CGFloat(0)
        }
    }
    
    class func timeToCGFloat(valueString: String) -> CGFloat {
        // Setup date formatter
        // for String to NSDate
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var valueDate: NSDate = dateFormatter.dateFromString(valueString)!
        
        return timeToCGFloat(valueDate)
    }
    
    class func timeToCGFloat(valueDate: NSDate) -> CGFloat {
        // Setup date formatter
        // for String to NSDate
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        // Get dates for the whole event
        var eventStartDate: NSDate = dateFormatter.dateFromString("11:00")!
        var eventEndDate: NSDate = dateFormatter.dateFromString("23:00")!
        
        // Convert them to a Double
        var fromLow: Double = eventStartDate.timeIntervalSinceReferenceDate
        var fromHigh: Double = eventEndDate.timeIntervalSinceReferenceDate
        
        // Set circle range
        var toLow: Double = 0
        var toHigh: Double = 360
        
        // Convert the input string to a NSDate
        // and convert it to a Double
        //        var valueDate: NSDate = dateFormatter.dateFromString(value)!
        var valueInterval: Double = valueDate.timeIntervalSinceReferenceDate
        
        // Convert the time interval (the Doubles) to degrees
        var degrees: Double = (valueInterval - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow
        
        // Convert the degree to a radian
        var radian: Double = (3.14159265359 * (degrees - 90) / 180)
        
        // Convert the radian to a CGFloat
        return CGFloat(radian)
    }
    
    class func isInRange(timeSlot1: TimeSlot, timeSlot2: TimeSlot) -> Bool {
        if timeSlot1.start == nil || timeSlot1.end == nil ||
            timeSlot2.start == nil || timeSlot2.end == nil {
            return false
        } else {
            var ts1start = (timeSlot1.start?.timeIntervalSinceReferenceDate)!
            var ts1end = (timeSlot1.end?.timeIntervalSinceReferenceDate)!
            
            var ts2start = (timeSlot2.start?.timeIntervalSinceReferenceDate)!
            var ts2end = (timeSlot2.start?.timeIntervalSinceReferenceDate)!
            
            if ( ts2start < ts2start && ts1end > ts2start ) ||
                ( ts1start < ts2end && ts1end > ts2end ) {
                return true
            } else  {
                return false
            }
        }
        
        
    }
    
}
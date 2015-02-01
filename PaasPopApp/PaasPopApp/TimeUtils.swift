//
//  TimeUtils.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 01-02-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import UIKit

class TimeUtils {
    
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
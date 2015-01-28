//
//  DataHelper.swift
//  PaasPopApp
//
//  Created by Wouter Habets on 22-01-15.
//  Copyright (c) 2015 Maiko Hermans. All rights reserved.
//

import Foundation
import Alamofire

class DataHelper {
    
    class func getTimeSlots(data: NSData) -> [TimeSlot] {
        var timeSlotsData: NSData = data
        
        var timeSlots: [TimeSlot]
        
        timeSlots = timeSlotsParseData(timeSlotsData)
        
        
        return timeSlots
    }
    
    class func timeSlotsParseData(data: NSData) -> [TimeSlot] {
        var returnData: [TimeSlot]
        var error: NSError?
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
        
        var timeSlots: [TimeSlot] = [TimeSlot]()
        
        if (error == nil) {
            
            let actsArray: NSArray = jsonData["acts"] as NSArray
            
            for act in actsArray {
                timeSlots.append(TimeSlot(fromNSDictionary: act as NSDictionary))
            }
        }
        
        return timeSlots
    }
}
